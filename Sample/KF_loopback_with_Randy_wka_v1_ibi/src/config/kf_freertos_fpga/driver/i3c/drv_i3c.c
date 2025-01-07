/*****************************************************************************
* Copyright (c) 2023 Microchip Technology Inc. and its subsidiaries.
* You may use this software and any derivatives exclusively with
* Microchip products.
* THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS".
* NO WARRANTIES, WHETHER EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE,
* INCLUDING ANY IMPLIED WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY,
* AND FITNESS FOR A PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP
* PRODUCTS, COMBINATION WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.
* IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
* INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
* WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
* BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE.
* TO THE FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL
* CLAIMS IN ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF
* FEES, IF ANY, THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.
* MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE
* OF THESE TERMS.
*****************************************************************************/

#include "drv_i3c.h"
#include "task1.h"
#include "definitions.h"

#define THRESHOLD_SIZE       32

/* Pending Transfer Context data */
struct i3c_pending_xfer pending_xfer_ctxt;

uint8_t target_tx_data_buf[MAX_TGT_TX_DATALEN];

static void DRV_I3C_ISR_Callback(uintptr_t context);

struct i3c_tgt_pvt_receive_node * _drv_i3c_free_tgt_rx_node_get_isr(struct xec_i3c_data *xec_data, bool dma_flag)
{
    uint8_t idx;
    struct i3c_tgt_pvt_receive_node *ret = NULL;

    for (idx = 0; idx < MAX_TGT_RX_LIST_COUNT; idx++) {
        
        if (TGT_RX_NODE_STATE_FREE == xec_data->tgt_pvt_rx[idx].state) {
        
            if (dma_flag) {
                xec_data->tgt_pvt_rx[idx].state = TGT_RX_NODE_STATE_IN_USE_DMA;
            } else
            {
                xec_data->tgt_pvt_rx[idx].state = TGT_RX_NODE_STATE_IN_USE;
            }
            ret = &xec_data->tgt_pvt_rx[idx];
            break;                 
        }
    }
    return ret;
}

#if I3C_ENABLE_DMA
static void _drv_i3c_dma_target_rx_enable(const struct device *dev)
{
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    struct dma_regs *dma_regs_rx = config->dma_regs_rx;
    struct i3c_tgt_pvt_receive_node *tgt_rx_node;    
    uint32_t dataAHBAddress;
    uint8_t device;
    
    tgt_rx_node = _drv_i3c_free_tgt_rx_node_get_isr(data, true);

    if (tgt_rx_node) {  

        dataAHBAddress = (uint32_t)&regs->rx_tx_port;
        device = dma_get_device_id(I3C_SEC_HOST_RX, 0);
        dma_setup_rx(dma_regs_rx, device, dataAHBAddress, (uint32_t)&tgt_rx_node->data_buf[0], TGT_RX_DATA_BUF_SIZE, true, true); 
        dma_start(dma_regs_rx);  
    }    
}
#endif 

void small_wait_with_nops (uint32_t endcount)
{

  while (endcount!=0)
  {
// RBG4   _nop();
   endcount--;
  }
}

void set_gpio_config_invert_or_non_invert(uint32_t gpio_address,  uint8_t invert_selection_1_is_invert)
{
    uint32_t orig_GPIO_value;

    orig_GPIO_value = *(unsigned int *)gpio_address;

    if (invert_selection_1_is_invert==1)
    {
        orig_GPIO_value  = orig_GPIO_value  | 0x800 ;
    }
    else
    {
  orig_GPIO_value  = orig_GPIO_value & 0xFFFFF7FF;
    }

    *(unsigned int *)gpio_address = orig_GPIO_value;
    small_wait_with_nops(0x1ff);
}

void i3c_mec5_tgt_wka_code(const struct device *dev)
{
//We will need to add code that dynamically figures the GPIO's being used for the device as a function of controller selected nad port selected.
//For now assume only one device in the DUT
    uint8_t port_select=0;
    uint32_t SDA_ADDRESS=0x40081168; //GPIO132
    uint32_t SCL_ADDRESS=0x40081180; //GPIO140
//uint32_t SDA_ADDRESS=0x40081028; //GPIO012
//    uint32_t SCL_ADDRESS=0x4008102C; //GPIO013
    
    port_select = (*(unsigned int *)0x40010400) & 0x03; //need to check ba
    
    if (port_select==0x01)
    {
        SDA_ADDRESS=0x40081028; //GPIO012
        SCL_ADDRESS=0x4008102C; //GPIO013
    }

    //START
    set_gpio_config_invert_or_non_invert (SDA_ADDRESS,  1);  //SDA low to issue start
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  1);  //SCL low 
    //7E
    set_gpio_config_invert_or_non_invert (SDA_ADDRESS,  0);  //SDA high to start the 0x7E 
            
        
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  0);  //POS EDGE SCL (1)  (SDA high)
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  1);
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  0); //POS EDGE SCL (2)
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  1);
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  0); //POS EDGE SCL (3)
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  1);
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  0); //POS EDGE SCL (4)
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  1);
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  0); //POS EDGE SCL (5)
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  1);
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  0); //POS EDGE SCL (6)
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  1);
    set_gpio_config_invert_or_non_invert (SDA_ADDRESS,  1); //SDA Lo
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  0); //POS EDGE SCL (7)   SDA Low
    //RSTDAA       
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  1);
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  0);//POS EDGE SCL (7)   SDA Low
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  1);
    set_gpio_config_invert_or_non_invert (SDA_ADDRESS,  0);//SDA 1
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  0);//POS EDGE SCL (8)   SDA High   (forcing it to see NACK ?)
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  1);
    set_gpio_config_invert_or_non_invert (SDA_ADDRESS,  1);//SDA 0
    set_gpio_config_invert_or_non_invert (SCL_ADDRESS,  0);//POS EDGE SCL (8) 
    set_gpio_config_invert_or_non_invert (SDA_ADDRESS,  0);
	LOG_DBG("%x", (*(unsigned int *)0x40010800));
//	LOG_DBG("%x", (*(unsigned int *)0x40010800));
}
/**
 * @brief Initialize the hardware.
 *
 * @param dev Pointer to controller device driver instance.
 */
int DRV_I3C_Init(const struct device *dev)
{
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    struct i3c_config_controller *ctrl_config = &data->common.ctrl_config;
#if (I3C_ENABLE_DMA)
    struct dma_main_regs *dma_main_ptr = (struct dma_main_regs *)DMA_MAIN_BLK_BASE_ADDRESS;
#endif
    int ret = 0, i3c_bus_mode = I3C_BUS_MODE_PURE;
    uint32_t core_clock = config->clock;
    int i;
	uint8_t enable_config;
    // Soft reset before configuration
    I3C_Soft_Reset(regs);

    ctrl_config->is_secondary = false;
    if (false == I3C_Is_Current_Role_Primary(regs)) {
        ctrl_config->is_secondary = true;
    }

#if (I3C_ENABLE_DMA)
    dma_main_enable(dma_main_ptr);
#endif

    if ((ctrl_config->is_secondary) && (ctrl_config->secondary_mode != I3C_SEC_MODE_HOST)) {
        I3C_Target_Init(regs, core_clock, &data->tgt_max_read_len, &data->tgt_max_write_len);
        data->tgt_tx_queued = false;
    } else {
        switch (i3c_bus_mode) {
        case I3C_BUS_MODE_MIXED_FAST:
        case I3C_BUS_MODE_MIXED_LIMITED:
            I3C_Controller_Clk_Cfg_I2C(regs, core_clock);
            //fallthrough
        case I3C_BUS_MODE_PURE:
            I3C_Controller_Clk_Cfg(regs, core_clock);
            break;
        default:
            return -EINVAL;
        }
    }

    /* Create Semaphore for synchronization with ISR -
     * may need to move to another location
     * Initial count is set to 0 so that we block when we first Pend
     */
    if (OSAL_RESULT_FALSE == OSAL_SEM_Create(&data->xfer_sem, OSAL_SEM_TYPE_BINARY, 0, 0))
    {
        /* Semaphore creation error */
        return -EIO;
    }

    /* Create Semaphore for thread synchronization
     * may need to move to another location
     */
    if (OSAL_RESULT_FALSE == OSAL_SEM_Create(&data->xfer_lock, OSAL_SEM_TYPE_BINARY, 0, 1))
    {
        /* Semaphore creation error */
        return -EIO;
    }

    if (OSAL_RESULT_FALSE == OSAL_SEM_Create(&data->events_sem, OSAL_SEM_TYPE_COUNTING, MAX_IBI_LIST_COUNT, 0))
    {
        /* Semaphore creation error */
        return -EIO;
    }

    if (ctrl_config->is_secondary) {
        I3C_Sec_Host_Config(regs);
    } else {
        I3C_Host_Config(regs);
    }

    /* Initialize the Queues and FIFO thresholds */
    I3C_Thresholds_Init(regs);

    if (ctrl_config->is_secondary) {
        I3C_CallbackRegister(I3C_CHAN_1, DRV_I3C_ISR_Callback, (uintptr_t)dev);
    } else {
        I3C_CallbackRegister(I3C_CHAN_0, DRV_I3C_ISR_Callback, (uintptr_t)dev);
    }

    if ((ctrl_config->is_secondary) && (ctrl_config->secondary_mode != I3C_SEC_MODE_HOST)) {
        /* Enable the i3c target interrupts */
        I3C_Target_Interrupts_Init(regs);
    } else {
        /* Enable the i3c controller interrupts */
        I3C_Controller_Interrupts_Init(regs);
    }
   
    enable_config = sbit_CONFG_ENABLE;
    if ((ctrl_config->is_secondary) && (ctrl_config->secondary_mode != I3C_SEC_MODE_HOST)) {
        enable_config |= sbit_MODE_TARGET;
    }
#if I3C_ENABLE_DMA
     enable_config |= sbit_DMA_MODE;
#endif    
    I3C_Enable(regs, config->address, enable_config);
    
    I3C_queue_depths_get(regs,
                        &data->fifo_depths.tx_fifo_depth,
                        &data->fifo_depths.rx_fifo_depth,
                        &data->fifo_depths.cmd_fifo_depth,
                        &data->fifo_depths.resp_fifo_depth,
                        &data->fifo_depths.ibi_fifo_depth);

    data->DAT_start_addr = 0;
    data->DAT_depth = 0;
    I3C_DAT_info_get(regs, &data->DAT_start_addr, &data->DAT_depth);

    data->DCT_start_addr = 0;
    data->DCT_depth = 0;
    I3C_DCT_info_get(regs, &data->DCT_start_addr, &data->DCT_depth);

    for ( i = 0; i < MAX_TARGETS; i++) {
        data->targets[i].state = TGT_STATE_NOT_PRESENT;
    }

#ifdef CONFIG_I3C_USE_IBI
    for ( i = 0; i < MAX_IBI_LIST_COUNT; i++) {
        data->ibis[i].state = IBI_NODE_STATE_FREE;
    }
#endif    
    
    /* Create bitmask of available positions in DAT */
    data->DAT_free_positions = GENMASK(data->DAT_depth - 1, 0);
    
    
    if ((ctrl_config->is_secondary) && (ctrl_config->secondary_mode != I3C_SEC_MODE_HOST)) {
        
 #if I3C_ENABLE_DMA    
        _drv_i3c_dma_target_rx_enable(dev);
#elif I3C_ENABLE_THRESHOLDS_INTR    
        _i3c_intr_thresholds_rx_enable(regs);
#endif        
        
    }
   
    
    return ret;
}

#ifdef CONFIG_I3C_USE_IBI

struct ibi_node * _drv_i3c_free_ibi_node_get_isr(struct xec_i3c_data *xec_data)
{
    uint8_t idx;
    struct ibi_node *ret = NULL;

    for (idx = 0; idx < MAX_IBI_LIST_COUNT; idx++) {

        if (IBI_NODE_STATE_FREE == xec_data->ibis[idx].state) {

            xec_data->ibis[idx].state = IBI_NODE_STATE_IN_USE;
            ret = &xec_data->ibis[idx];
            break;
        }
    }
    return ret;
}

#endif

struct i3c_tgt_pvt_receive_node * _drv_i3c_dma_in_use_tgt_rx_node_get_isr(struct xec_i3c_data *xec_data)
{
    uint8_t idx;
    struct i3c_tgt_pvt_receive_node *ret = NULL;

    for (idx = 0; idx < MAX_TGT_RX_LIST_COUNT; idx++) {

        if (TGT_RX_NODE_STATE_IN_USE_DMA == xec_data->tgt_pvt_rx[idx].state) {
        
            ret = &xec_data->tgt_pvt_rx[idx];
            break;
        }
    }
    return ret;
}

static int _drv_i3c_targets_free_pos_get(const struct xec_i3c_data *xec_data, uint8_t *free_posn)
{
    uint8_t idx;
    int ret = -1;

    for (idx = 0; idx < MAX_TARGETS; idx++) {

        if (TGT_STATE_NOT_PRESENT == xec_data->targets[idx].state) {

            *free_posn = idx;
            ret = 0;
            break;
        }
    }
    return ret;
}

static int _drv_i3c_targets_next_DAA_get(struct xec_i3c_data *xec_data, struct targets_on_bus **tgt_DAA)
{
    uint8_t idx;
    int ret = -1;

    for (idx = 0; idx < MAX_TARGETS; idx++) {

        if (TGT_STATE_NEEDS_DAA == xec_data->targets[idx].state) {

            *tgt_DAA = &xec_data->targets[idx];
            ret = 0;
            break;
        }
    }
    return ret;
}

/* Updates actual address assigned during DAA */
static void _drv_i3c_targets_DAA_addr_update(struct xec_i3c_data *data, uint64_t pid, uint8_t new_addr, uint8_t new_dat_idx)
{
    uint8_t idx, dat_idx;

    for (idx = 0; idx < MAX_TARGETS; idx++) {

        if (TGT_STATE_DAA_IN_PROGRESS == data->targets[idx].state) {

            if (pid == data->targets[idx].pid) {
                data->targets[idx].address = new_addr;
                data->targets[idx].dat_idx = new_dat_idx;
                break;
            }
        }
    }
}

static void _drv_i3c_targets_DAA_done(const struct device *dev, bool DAA_success, uint16_t dat_success_idx)
{
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    uint8_t idx, dat_idx;

    for (idx = 0; idx < MAX_TARGETS; idx++) {

        if (TGT_STATE_DAA_IN_PROGRESS == data->targets[idx].state) {

            dat_idx = data->targets[idx].dat_idx;

            if (DAA_success && dat_idx <= dat_success_idx) {

                /* Mark state as address assigned */
                data->targets[idx].state = TGT_STATE_ADDR_ASSIGNED;

            } else {

                /* Invalidate the DAT entry */
                I3C_DAT_DynamicAddr_write(regs, data->DAT_start_addr, dat_idx, 0);

                /* Mark the DAT position as free */
                data->DAT_free_positions |= (1U << dat_idx);

                /* Mark state as needs DAA */
                data->targets[idx].state = TGT_STATE_NEEDS_DAA;
            }
        }
    }
}

static int _drv_i3c_DAT_free_pos_get(const struct xec_i3c_data *xec_data, uint16_t *free_posn)
{
    uint16_t max_positions_bitmask = 0U;
    uint16_t free_positions_bitmask = 0U;
    uint16_t posn=0U;
    int ret = 0;

    max_positions_bitmask = GENMASK(xec_data->DAT_depth - 1, 0);

    if (xec_data->DAT_free_positions & max_positions_bitmask) {

        /* Get Leftmost Set bit in DAT_free_positions */
        free_positions_bitmask = xec_data->DAT_free_positions;
        while(!(free_positions_bitmask & (0x01U << posn))) {
            posn++;
        }
        *free_posn = posn;

    } else {
        ret = -1;
    }

    return ret;
}

static int _drv_i3c_DAT_idx_get(const struct xec_i3c_data *xec_data, const uint8_t tgt_addr, uint8_t *tgt_posn)
{
    uint8_t idx;
    int ret = -1;

    for (idx = 0; idx < xec_data->DAT_depth; idx++) {

        if (TGT_STATE_ADDR_ASSIGNED == xec_data->targets[idx].state) {

             if (tgt_addr == xec_data->targets[idx].address) {

                *tgt_posn = xec_data->targets[idx].dat_idx;
                ret = 0;
                break;
             }
        }
    }
    return ret;
}

static int _drv_wait_for_response(OSAL_SEM_HANDLE_TYPE* sem_wait)
{
    int ret = 0;

    if (OSAL_RESULT_FALSE == OSAL_SEM_Pend(sem_wait, DRV_RESP_WAIT_MS))
    {
        ret = -ETIMEDOUT;
    }
    return ret;
}

int DRV_I3C_attach_device(const struct device *dev, struct i3c_device_desc *desc,
                  uint8_t addr)
{

    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    uint16_t free_posn_DAT = 0;
    uint8_t target_info_idx = 0;
    bool program_dyn_addr = false;
    int ret = -1;

    if (_drv_i3c_DAT_free_pos_get(data, &free_posn_DAT)) {

        /* Unable to find a free location in DAT */
        LOG_ERR("%s: no space in DAT for i3c device: %s", dev->name, desc->dev->name);
        return ret;
    }

    if (_drv_i3c_targets_free_pos_get(data, &target_info_idx)) {

        /* Unable to find a free location in targets list */
        LOG_ERR("%s: no space in targets list for i3c device: %s", dev->name, desc->dev->name);
        return ret;
    }

    /* Initialize the target info node */
    data->targets[target_info_idx].state = TGT_STATE_ADDR_ASSIGNED;
    data->targets[target_info_idx].address = addr;
    data->targets[target_info_idx].pid = desc->pid;
    desc->controller_priv = &data->targets[target_info_idx];

    /* Check if address is a dynamic address (set by primary controller) */
    if (desc->dynamic_addr != 0) {

        program_dyn_addr = true;
    }

    /* Check if dynamic address will be assigned by SETDASA */
    if ((desc->dynamic_addr == 0) && (desc->static_addr != 0)) {

        program_dyn_addr = true;
    }

    if (program_dyn_addr) {

        I3C_DAT_DynamicAddr_write(regs, data->DAT_start_addr, free_posn_DAT, addr);

        data->targets[target_info_idx].dat_idx = free_posn_DAT;

        /* Mark the free position as used */
        data->DAT_free_positions &= ~(1U << free_posn_DAT);

    } else {
        data->targets[target_info_idx].state = TGT_STATE_NEEDS_DAA;
    }

    return 0;
}

int DRV_I3C_detach_device(const struct device *dev, struct i3c_device_desc *desc)
{

    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    struct targets_on_bus *target_info = desc->controller_priv;

    if (NULL == target_info) {
        LOG_ERR("%s: %s: device not attached", dev->name, desc->dev->name);
        return -EINVAL;
    }

    /* Invalidate the DAT entry */
    I3C_DAT_DynamicAddr_write(regs, data->DAT_start_addr, target_info->dat_idx, 0);

    /* Mark the DAT position as free */
    data->DAT_free_positions |= (1U << target_info->dat_idx);

    /* Reclaim the target info node */
    target_info->state = TGT_STATE_NOT_PRESENT;
    target_info->address = 0;
    target_info->dat_idx = 0;

    /* Clear the target info */
    desc->controller_priv = NULL;

    return 0;
}

int DRV_I3C_reattach_device(const struct device *dev, struct i3c_device_desc *desc,
                    uint8_t old_dyn_addr)
{
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    struct targets_on_bus *target_info = desc->controller_priv;

    if (NULL == target_info) {
        LOG_ERR("%s: %s: device not attached", dev->name, desc->dev->name);
        return -EINVAL;
    }

    if (target_info->address != old_dyn_addr) {
        LOG_ERR("Old dynamic address doesn't match the one in DAT");
        return -EINVAL;
    }

    /* Update the DAT entry */
    I3C_DAT_DynamicAddr_write(regs, data->DAT_start_addr, target_info->dat_idx, desc->dynamic_addr);

    /* Update the target info node with new address */
    target_info->address = desc->dynamic_addr;

    return 0;
}

static void _drv_pending_xfer_ctxt_init(void)
{
    int i = 0;

    pending_xfer_ctxt.xfer_type = 0;

#if I3C_ENABLE_THRESHOLDS_INTR

    pending_xfer_ctxt.current_xfer_idx = 0;
    pending_xfer_ctxt.use_thresholds = false;

#endif

    for (i=0; i<MAX_I3C_MSGS; i++)
    {
        pending_xfer_ctxt.node[i].data_buf = NULL;
        pending_xfer_ctxt.node[i].read = false;
        pending_xfer_ctxt.node[i].error_status = 0;
        pending_xfer_ctxt.node[i].tid = 0;
        pending_xfer_ctxt.node[i].ret_data_len = 0;

#if I3C_ENABLE_THRESHOLDS_INTR
        pending_xfer_ctxt.node[i].rem_data_len = 0;
        pending_xfer_ctxt.node[i].read_iter_data_len = 0;
#endif
    }
}

static void _drv_dct_info_init(struct i3c_DCT_info *info)
{
    info->bcr = 0x0;
    info->dcr = 0x0;
    info->dynamic_addr = 0x0;
    info->pid = 0x0;
}

static int _drv_i3c_CCC(const struct device *dev, struct i3c_ccc_payload *payload, uint8_t *response)
{
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data   *xec_data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    struct i3c_DO_CCC do_ccc_instance;
    struct i3c_ccc_target_payload *target;
    int ret = 0;
    int n;
    uint8_t num_targets;
    uint8_t DAT_idx; /* Index of the device in Device Address Table */

    *response = 0;

    memset(&do_ccc_instance, 0x00, sizeof(do_ccc_instance));

    /* Handle Broadcast Write CCC */
    if (I3C_CCC_BROADCAST_MAX_ID >= payload->ccc.id)
    {
        do_ccc_instance.read = false; //No Broadcast Read
        do_ccc_instance.defining_byte_valid = false;
        do_ccc_instance.ccc_id = payload->ccc.id;

        if (payload->ccc.data_len) {
            /* Set the first byte as the optional defining byte */
            do_ccc_instance.defining_byte = payload->ccc.data[0];
            do_ccc_instance.defining_byte_valid = true;

            /* Handle optional write data*/
            if (1 < payload->ccc.data_len)
            {
                do_ccc_instance.data_buf = &payload->ccc.data[1];
                do_ccc_instance.data_len = payload->ccc.data_len - 1;
            }
        }

        _drv_pending_xfer_ctxt_init();
        pending_xfer_ctxt.xfer_type = XFER_TYPE_CCC;
        pending_xfer_ctxt.xfer_sem = &xec_data->xfer_sem;

        I3C_DO_CCC(regs, &do_ccc_instance, &pending_xfer_ctxt.node[0].tid);

        if (_drv_wait_for_response(&xec_data->xfer_sem)) {
            I3C_Xfer_Reset(regs);
            ret = -EBUSY;
        } else {
            if (pending_xfer_ctxt.xfer_status) {
                *response = pending_xfer_ctxt.xfer_status;
                ret = -EIO;
            }
        }

    } else { /* Handle Directed CCC */

        num_targets = payload->targets.num_targets;

        /* Ensure num_targets is valid */
        if ((0 == num_targets) || (MAX_TARGETS < num_targets)) {

            ret = -EINVAL;
        } else {

            for (n = 0; n < num_targets; n++) {

                do_ccc_instance.defining_byte_valid = false;
                do_ccc_instance.ccc_id = payload->ccc.id;

                _drv_pending_xfer_ctxt_init();
                pending_xfer_ctxt.xfer_type = XFER_TYPE_CCC;
                pending_xfer_ctxt.xfer_sem = &xec_data->xfer_sem;

                if (payload->ccc.data_len) {
                    /* Take only the defining byte from the ccc data, if any other
                     * data then we are ignoring since for directed CCC there is
                     * only defining byte before the target slave address */
                    do_ccc_instance.defining_byte = payload->ccc.data[0];
                    do_ccc_instance.defining_byte_valid = true;
                }

                target = &payload->targets.payloads[n];

                DAT_idx = 0;
                if (_drv_i3c_DAT_idx_get(xec_data, target->addr, &DAT_idx)) {
                    /* Unable to locate target in target list */
                    ret = -EINVAL;
                    break;
                }

                do_ccc_instance.tgt_idx = DAT_idx;
                do_ccc_instance.data_buf = target->data;
                do_ccc_instance.data_len = target->data_len;

                if (target->rnw) {
                    do_ccc_instance.read = true;
                    pending_xfer_ctxt.node[0].data_buf = do_ccc_instance.data_buf;
                    pending_xfer_ctxt.node[0].read = true;
                }

                I3C_DO_CCC(regs, &do_ccc_instance, &pending_xfer_ctxt.node[0].tid);

                if (_drv_wait_for_response(&xec_data->xfer_sem)) {
                    I3C_Xfer_Reset(regs);
                    ret = -EBUSY;
                    break;
                } else {
                    if (pending_xfer_ctxt.xfer_status) {
                        *response = pending_xfer_ctxt.xfer_status;
                        ret = -EIO;
                        break;
                    }
                }
            }
        }
    }

    return ret;
}

/**
 * @brief Send Common Command Code (CCC).
 *
 * @see i3c_do_ccc
 *
 * @param dev Pointer to controller device driver instance.
 * @param payload Pointer to CCC payload.
 *
 * @return @see i3c_do_ccc
 */
int DRV_I3C_do_CCC(const struct device *dev, struct i3c_ccc_payload *payload)
{
    const struct xec_i3c_config *config = dev->config;
    struct i3c_xec_regs *regs = config->regs;
    struct xec_i3c_data *data = dev->data;
    uint8_t response=0;
    int ret = 0;

    /* Make sure we are currently the active controller */
    if(false == I3C_Is_Current_Role_Master(regs)
            && I3C_Is_Current_Role_BusMaster(regs)) {
        ret = -EACCES;
        goto exit_ccc;
    }

    OSAL_SEM_Pend(&data->xfer_lock, OSAL_WAIT_FOREVER);
    LOG_DBG("[%s] - Sending CCC = 0x%02X", __FUNCTION__, payload->ccc.id);
    ret = _drv_i3c_CCC(dev, payload, &response);
    OSAL_SEM_Post(&data->xfer_lock);

    if ((!ret) && response) {
        /* Error in Response */
        LOG_ERR("!!Error - 0x%08x - %d!!", response, ret);
    }

exit_ccc:
    return ret;
}

/**
 * @brief Perform Dynamic Address Assignment.
 *
 * @see i3c_do_daa
 *
 * @param dev Pointer to controller device driver instance.
 *
 * @return @see i3c_do_daa
 */
int DRV_I3C_do_DAA(const struct device *dev)
{
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    struct targets_on_bus *target_needs_DAA = NULL;
    uint64_t pid;
    uint16_t DAA_entries_count = 0;
    uint16_t DAA_success_count = 0;
    uint16_t DAT_first_free_posn = 0;
    struct i3c_DCT_info dct_info;
    int ret = 0, idx;

    /* DAA should not be done by secondary controllers */
    if(false == I3C_Is_Current_Role_Master(regs)
            && I3C_Is_Current_Role_BusMaster(regs)) {
        ret = -EACCES;
        goto exit_da;
    }

    if (_drv_i3c_DAT_free_pos_get(data, &DAT_first_free_posn)) {

        /* No free location in DAT */
        LOG_ERR("%s: no space in DAT", dev->name);
        ret = -ENOMEM;
        goto exit_da;
    }

    OSAL_SEM_Pend(&data->xfer_lock, OSAL_WAIT_FOREVER);
    for (idx = DAT_first_free_posn; idx < data->DAT_depth; idx++) {

        /* Ensure DAT position is free */
        if (!(data->DAT_free_positions & (1U << idx))) {
            /* DAT position is not available; can occur during Hot Join
             * Go for the the next DAT position
             */
            continue;
        }

        if (_drv_i3c_targets_next_DAA_get(data, &target_needs_DAA)) {
            break;
            /* IF DISCOVERY: Add logic to fill the remaining entries in DAT with possible
             * dynamic address so that new devices on the bus can be discovered */
        } else {
            if (NULL != target_needs_DAA) {
                target_needs_DAA->dat_idx = idx;
                I3C_DAT_DynamicAddrAssign_write(regs, data->DAT_start_addr, idx, target_needs_DAA->address);
                 /* Mark the free position as used */
                data->DAT_free_positions &= ~(1U << idx);
                DAA_entries_count++;
                target_needs_DAA->state = TGT_STATE_DAA_IN_PROGRESS;
                /* Note: PID will be 0 for hot join device */
                LOG_DBG("ENTDAA in progress for 0x%04x%08x",
                        (uint16_t)(target_needs_DAA->pid >> 32U),
                        (uint32_t)(target_needs_DAA->pid & 0xFFFFFFFFU));
            }
        }
    }

    if (DAA_entries_count) {
        _drv_pending_xfer_ctxt_init();
        pending_xfer_ctxt.xfer_type = XFER_TYPE_ENTDAA;
        pending_xfer_ctxt.xfer_sem = &data->xfer_sem;

        /* Start the DAA process */
        I3C_DO_DAA(regs, DAT_first_free_posn, DAA_entries_count, &pending_xfer_ctxt.node[0].tid);

        if (_drv_wait_for_response(&data->xfer_sem)) {
            I3C_Xfer_Reset(regs);
            ret = -EBUSY;
        } else {
            if (pending_xfer_ctxt.xfer_status) {
                LOG_ERR("DAA status error - 0x%x", pending_xfer_ctxt.xfer_status);

                if (pending_xfer_ctxt.node[0].ret_data_len) {
                    LOG_ERR("DAA remaining devices count - %d", pending_xfer_ctxt.node[0].ret_data_len);
                    /* Not all devices in the static list (meant for DAA) is assigned address
                     * This is an error condition?
                     */
                }
                ret = -EIO;
            }
        }

        DAA_success_count = DAA_entries_count - pending_xfer_ctxt.node[0].ret_data_len;

        if (ret != -EBUSY) {
            /* DAA is successful (maybe partial), but devices may have different intended */
            /* dynamic address due to arbitration, need to update accordingly */
            for (idx = 0; idx < DAA_success_count; idx++) {

                _drv_dct_info_init(&dct_info);
                I3C_DCT_read(regs, data->DCT_start_addr, idx, &dct_info);
                pid = dct_info.pid;

                const struct i3c_device_id i3c_id = I3C_DEVICE_ID(pid);
                const uint16_t vendor_id = (uint16_t)(pid >> 32U);
                const uint32_t part_no = (uint32_t)(pid & 0xFFFFFFFFU);
                struct i3c_device_desc *target = i3c_device_find(dev, &i3c_id);

                if (target == NULL) {
                    LOG_DBG("%s: PID 0x%04x%08x is not in registered device "
                        "list, given DA 0x%02x",
                        dev->name, vendor_id, part_no, dct_info.dynamic_addr);
                    /* This is probably an error condition ??
                     * what should we do?
                     */
                    i3c_addr_slots_mark_i3c(
                        &data->common.attached_dev.addr_slots, dct_info.dynamic_addr);
                } else {
                    target->dynamic_addr = dct_info.dynamic_addr;
                    target->bcr = dct_info.bcr;
                    target->dcr = dct_info.dcr;

                    _drv_i3c_targets_DAA_addr_update(data, pid, dct_info.dynamic_addr, DAT_first_free_posn + idx);

                    LOG_DBG("%s: PID 0x%04x%08x assigned dynamic address 0x%02x",
                        dev->name, vendor_id, part_no, dct_info.dynamic_addr);
                }
            }
        }

        _drv_i3c_targets_DAA_done(dev, ret != EBUSY, DAT_first_free_posn + DAA_success_count - 1);
    }

exit_da:
    OSAL_SEM_Post(&data->xfer_lock);

    return ret;
}

/**
 * @brief Transfer messages in I3C mode
 *
 * @see _drv_i3c_xfers
 *
 * @param dev Pointer to controller device driver instance.
 * @param msgs Pointer to I3C messages.
 * @param response Pointer to xfer response
 * @return @see _drv_i3c_xfers
 */
static int _drv_i3c_xfers(const struct device *dev, struct i3c_msg *msgs,
                            uint8_t num_msgs, uint8_t tgt_addr, uint8_t *response)
{
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *xec_data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    struct i3c_XFER do_xfer_instance;
#if I3C_ENABLE_DMA
    struct dma_regs *dma_regs_tx = config->dma_regs_tx;
    struct dma_regs *dma_regs_rx = config->dma_regs_rx;    
    uint32_t dataAHBAddress;
    uint8_t device;
#endif    
    uint8_t i = 0;
    int ret = 0;
    uint8_t DAT_idx; /* Index of the device in Device Address Table */

    *response = 0;

    memset(&do_xfer_instance, 0x00, sizeof(do_xfer_instance));

    _drv_pending_xfer_ctxt_init();
    pending_xfer_ctxt.xfer_type = XFER_TYPE_PVT_RW;
    pending_xfer_ctxt.xfer_sem = &xec_data->xfer_sem;

    for(i=0; i< num_msgs; i++)
    {
        if (I3C_MSG_READ == (msgs[i].flags & I3C_MSG_RW_MASK)) {
            LOG_DBG("Read [%d] bytes from target [0x%02x]", msgs[i].len, tgt_addr);
            do_xfer_instance.cmds[i].read = true;
        } else {
            LOG_DBG("Send [%d] bytes to target [0x%02x]", msgs[i].len, tgt_addr);
            do_xfer_instance.cmds[i].read = false;
        }

        if (I3C_MSG_STOP == (msgs[i].flags & I3C_MSG_STOP)) {
            do_xfer_instance.cmds[i].stop = true;
        } else {
            do_xfer_instance.cmds[i].stop = false;
        }

        if (I3C_MSG_HDR == (msgs[i].flags & I3C_MSG_HDR)) {
            /* Only DDR supported */
            do_xfer_instance.cmds[i].xfer_speed = XFER_SPEED_HDR_DDR;
        } else {
            /* Use SDR0 for fast xfer */
            do_xfer_instance.cmds[i].xfer_speed = XFER_SPEED_SDR0;
        }

        if (I3C_MSG_PEC == (msgs[i].flags & I3C_MSG_PEC)) {
            do_xfer_instance.cmds[i].pec_en = true;
        } else {
            do_xfer_instance.cmds[i].pec_en = false;
        }

        DAT_idx = 0;
        if (_drv_i3c_DAT_idx_get(xec_data, tgt_addr, &DAT_idx)) {
            /* Unable to locate target in target list */
            ret = -EINVAL;
            break;
        }

        do_xfer_instance.cmds[i].tgt_idx = DAT_idx;
        do_xfer_instance.cmds[i].data_buf = msgs[i].buf;
        do_xfer_instance.cmds[i].data_len = msgs[i].len;

        pending_xfer_ctxt.node[i].read = do_xfer_instance.cmds[i].read;
        pending_xfer_ctxt.node[i].data_buf = do_xfer_instance.cmds[i].data_buf;
        
#if I3C_ENABLE_DMA


        if (pending_xfer_ctxt.node[i].read) {
            
            _i3c_rx_fifo_rst(regs);
            dataAHBAddress = (uint32_t)&regs->rx_tx_port;
            device = dma_get_device_id(I3C_HOST_RX, 0);
            dma_setup_rx(dma_regs_rx, device, dataAHBAddress, (uint32_t)do_xfer_instance.cmds[i].data_buf, do_xfer_instance.cmds[i].data_len, true, true); 
            dma_start(dma_regs_rx);
            
        } else {
            
            dataAHBAddress = (uint32_t)&regs->rx_tx_port;
            device = dma_get_device_id(I3C_HOST_TX, 0);
            dma_setup_tx(dma_regs_tx, device, dataAHBAddress, (uint32_t)do_xfer_instance.cmds[i].data_buf, do_xfer_instance.cmds[i].data_len, true); 
            dma_start(dma_regs_tx);
        }
#elif I3C_ENABLE_THRESHOLDS_INTR

        pending_xfer_ctxt.node[i].data_len = do_xfer_instance.cmds[i].data_len;
        
                

        if (pending_xfer_ctxt.node[i].read) {

            if (do_xfer_instance.cmds[i].data_len > xec_data->fifo_depths.rx_fifo_depth) {

                pending_xfer_ctxt.node[i].rem_data_len = do_xfer_instance.cmds[i].data_len;
                do_xfer_instance.cmds[i].rem_data_len = pending_xfer_ctxt.node[i].rem_data_len;

                pending_xfer_ctxt.node[i].read_iter_data_len = THRESHOLD_SIZE;

                pending_xfer_ctxt.use_thresholds = true;

            } else {
                pending_xfer_ctxt.node[i].rem_data_len = 0;
                do_xfer_instance.cmds[i].rem_data_len = 0;
                pending_xfer_ctxt.node[i].read_iter_data_len = 0;
            }

        } else {

            if (do_xfer_instance.cmds[i].data_len > xec_data->fifo_depths.tx_fifo_depth) {

                pending_xfer_ctxt.node[i].rem_data_len = do_xfer_instance.cmds[i].data_len - xec_data->fifo_depths.tx_fifo_depth;
                do_xfer_instance.cmds[i].rem_data_len = pending_xfer_ctxt.node[i].rem_data_len;

                //thresholds_flag = true;
                pending_xfer_ctxt.use_thresholds = true;

            } else {
                pending_xfer_ctxt.node[i].rem_data_len = 0;
                do_xfer_instance.cmds[i].rem_data_len = 0;
            }

        }

        pending_xfer_ctxt.current_xfer_idx = i;
        //I3C_DO_Xfer_Prep(regs, &do_xfer_instance.cmds[i], &pending_xfer_ctxt.node[i].tid);
        
#endif   
        I3C_DO_Xfer_Prep(regs, &do_xfer_instance.cmds[i], &pending_xfer_ctxt.node[i].tid);
    }

    /* Set the number of responses threshold to trigger interrupt */
    I3C_Thresholds_Response_buf_set(regs, num_msgs - 1);

    for(i=0; i< num_msgs; i++) {
        I3C_DO_Xfer(regs, &do_xfer_instance.cmds[i]);
    }

    if (_drv_wait_for_response(&xec_data->xfer_sem)) {
        ret = -EBUSY;
        I3C_Xfer_Reset(regs);
    } else {
        if (pending_xfer_ctxt.xfer_status) {
            *response = pending_xfer_ctxt.xfer_status;
            ret = -EIO;
        }
    }

    return ret;
}

#if (I3C_ENABLE_THRESHOLDS_INTR || I3C_ENABLE_DMA)
static int _drv_i3c_xfers_iter(const struct device *dev, struct i3c_msg *msgs,
                            uint8_t num_msgs, uint8_t tgt_addr, uint8_t *response)
{
    struct xec_i3c_data *data = dev->data;
    int ret;

    if(num_msgs == 0) {
        return 0;
    }

    OSAL_SEM_Pend(&data->xfer_lock, OSAL_WAIT_FOREVER);
    ret = _drv_i3c_xfers(dev, msgs, num_msgs, tgt_addr, response);
    OSAL_SEM_Post(&data->xfer_lock);

    if ((ret) && response) {
        /* Error in Response */
        LOG_ERR("!!Error - 0x%08x - %d!!", response, ret);
        return ret;
    }

    return 0;
}
#endif


/**
 * @brief Transfer messages in I3C mode
 *
 * @see DRV_I3C_Xfers
 *
 * @param dev Pointer to controller device driver instance.
 * @param msgs Pointer to I3C messages.
 *
 * @return @see DRV_I3C_Xfers
 */
int DRV_I3C_Xfers(const struct device *dev, struct i3c_device_desc *target,
                    struct i3c_msg *msgs, uint8_t num_msgs)
{
    const struct xec_i3c_config *config = dev->config;
    struct i3c_xec_regs *regs = config->regs;
    struct xec_i3c_data *data = dev->data;
#if (I3C_ENABLE_THRESHOLDS_INTR || !I3C_ENABLE_DMA)
    uint32_t nrxwords = 0, ntxwords = 0;
    int start_idx = 0;
    bool use_thresholds_intr, messages_to_send;
#endif
    uint8_t response=0;
    int ret = 0, i = 0;

    /* Check to ensure i3c instance is in controller mode */
    if(false == I3C_Is_Current_Role_Master(regs)) {
        ret = -EACCES;
        goto exit_xfer;
    }

    if(num_msgs == 0) {
        ret = 0;
        goto exit_xfer;
    }

    if(0U == target->dynamic_addr) {
        ret = -EINVAL;
        goto exit_xfer;
    }

    if (num_msgs > data->fifo_depths.cmd_fifo_depth) {
        ret = -ENOTSUP;
        goto exit_xfer;
    }

#if (I3C_ENABLE_DMA)
    
    /* We will send one message at a time using DMA
     * We are going to point the DMA to the application buffers */
    
    for (i = 0; i < num_msgs; i++) {
        
        ret = _drv_i3c_xfers_iter(dev, &msgs[i], 1, target->dynamic_addr, &response);
        if (ret) {
            goto exit_xfer;
        }
    }

#elif (I3C_ENABLE_THRESHOLDS_INTR)

    start_idx = 0;
    for (i = 0; i < num_msgs; i++) {

        use_thresholds_intr = false;
        messages_to_send = true;

        if (I3C_MSG_READ == (msgs[i].flags & I3C_MSG_RW_MASK)) {

             if (msgs[i].len > data->fifo_depths.rx_fifo_depth) {
                 use_thresholds_intr = true;
             } else {
                 nrxwords += ceiling_fraction(msgs[i].len, 4);
             }
        } else {
            if (msgs[i].len > data->fifo_depths.tx_fifo_depth) {
                use_thresholds_intr = true;
            } else {
                ntxwords += ceiling_fraction(msgs[i].len, 4);
            }
        }

        if (ntxwords > data->fifo_depths.tx_fifo_depth ||
            nrxwords > data->fifo_depths.rx_fifo_depth) {
                ret = -ENOTSUP;
                goto exit_xfer;
        }

        if (use_thresholds_intr) {
            /* Send first the messages less than fifo size */
            ret = _drv_i3c_xfers_iter(dev, &msgs[start_idx], i - start_idx, target->dynamic_addr, &response);
            if (ret) {
                goto exit_xfer;
            } else {
                /* Send the packet with size greater than fifo using threshold interrupt*/
                ret = _drv_i3c_xfers_iter(dev, &msgs[start_idx], 1, target->dynamic_addr, &response);
                if (ret) {
                    goto exit_xfer;
                }
                /* update start index to next message */
                start_idx = i + 1;
            }

            ntxwords = 0; nrxwords = 0;
            messages_to_send = false;
        }
    }

    if (messages_to_send) {
        ret = _drv_i3c_xfers_iter(dev, &msgs[start_idx], i - start_idx, target->dynamic_addr, &response);
        if (ret) {
            goto exit_xfer;
        }
    }
#else

    for (i = 0; i < num_msgs; i++) {
		 if (I3C_MSG_READ == (msgs[i].flags & I3C_MSG_RW_MASK)) {
			nrxwords += ceiling_fraction(msgs[i].len, 4);
         } else {
			ntxwords += ceiling_fraction(msgs[i].len, 4);
         }
	}

    
	if (ntxwords > data->fifo_depths.tx_fifo_depth ||
	    nrxwords > data->fifo_depths.rx_fifo_depth) {
		ret = -ENOTSUP;
        goto exit_xfer;
    }
    
    
    OSAL_SEM_Pend(&data->xfer_lock, OSAL_WAIT_FOREVER);
    ret = _drv_i3c_xfers(dev, msgs, num_msgs, target->dynamic_addr, &response);
    OSAL_SEM_Post(&data->xfer_lock);
    
    if ((!ret) && response) {
        /* Error in Response */        
        LOG_ERR("!!Error - 0x%08x - %d!!", response, ret);
    }
    
#endif

exit_xfer:
    return ret;
}

#ifdef CONFIG_I3C_USE_IBI
int DRV_I3C_IBI_enable(const struct device *dev, struct i3c_device_desc *target)
{
    const struct xec_i3c_config *config = dev->config;
    struct i3c_xec_regs *regs = config->regs;
    struct xec_i3c_data *data = dev->data;
    struct i3c_ccc_events i3c_events;
    struct i3c_IBI_SIR enable_ibi_instance;
    uint8_t DAT_idx = 0; /* Index of the device in Device Address Table */
    int ret = 0;

    /* Check to ensure i3c instance is in controller mode */
    if(false == I3C_Is_Current_Role_Master(regs)) {
        return -EACCES;
    }

    if(0U == target->dynamic_addr) {
        return -EINVAL;
    }

    if (!i3c_device_is_ibi_capable(target)) {
        return -EINVAL;
    }

    DAT_idx = 0;
    if (_drv_i3c_DAT_idx_get(data, target->dynamic_addr, &DAT_idx)) {
        /* Unable to locate target in target list */
        return -EINVAL;
    }

    LOG_DBG("%s: IBI enabling for 0x%02x (BCR 0x%02x)", dev->name, target->dynamic_addr,
    target->bcr);

    /* Tell target to enable IBI */
    i3c_events.events = I3C_CCC_EVT_INTR;
    ret = i3c_ccc_do_events_set(target, true, &i3c_events);
    if (ret != 0) {
        LOG_ERR("%s: Error sending IBI ENEC for 0x%02x (%d)", dev->name,
            target->dynamic_addr, ret);
        return ret;
    }

    enable_ibi_instance.DAT_start = data->DAT_start_addr;
    enable_ibi_instance.tgt_dat_idx = DAT_idx;
    enable_ibi_instance.ibi_has_payload = i3c_ibi_has_payload(target);

    I3C_IBI_SIR_Enable(regs, &enable_ibi_instance);

    return 0;
}

int DRV_I3C_IBI_disable(const struct device *dev, struct i3c_device_desc *target)
{
    const struct xec_i3c_config *config = dev->config;
    struct i3c_xec_regs *regs = config->regs;
    struct xec_i3c_data *data = dev->data;
    struct i3c_ccc_events i3c_events;
    struct i3c_IBI_SIR disable_ibi_instance;
    uint8_t DAT_idx = 0; /* Index of the device in Device Address Table */
    int ret = 0;

    /* Check to ensure i3c instance is in controller mode */
    if(false == I3C_Is_Current_Role_Master(regs)) {
        return -EACCES;
    }

    if(0U == target->dynamic_addr) {
        return -EINVAL;
    }

    if (!i3c_device_is_ibi_capable(target)) {
        return -EINVAL;
    }

    DAT_idx = 0;
    if (_drv_i3c_DAT_idx_get(data, target->dynamic_addr, &DAT_idx)) {
        /* Unable to locate target in target list */
        return -EINVAL;
    }
    
    LOG_DBG("%s: IBI disabling for 0x%02x (BCR 0x%02x)", dev->name, target->dynamic_addr,
    target->bcr);

    /* Tell target to enable IBI */
    i3c_events.events = I3C_CCC_EVT_INTR;
    ret = i3c_ccc_do_events_set(target, false, &i3c_events);
    if (ret != 0) {
        LOG_ERR("%s: Error sending IBI DISEC for 0x%02x (%d)", dev->name,
            target->dynamic_addr, ret);
        return ret;
    }

    disable_ibi_instance.DAT_start = data->DCT_start_addr;
    disable_ibi_instance.tgt_dat_idx = DAT_idx;
    disable_ibi_instance.ibi_has_payload = i3c_ibi_has_payload(target);

    I3C_IBI_SIR_Disable(regs, &disable_ibi_instance);

    return 0;
}

int DRV_I3C_target_ibi_raise(const struct device *dev, struct i3c_ibi *request)
{
    const struct xec_i3c_config *config = dev->config;
    struct i3c_xec_regs *regs = config->regs;
    struct xec_i3c_data *xec_data = dev->data;
    struct i3c_raise_IBI_SIR ibi_sir_request;
    int ret = 0;

    if (request == NULL) {
        return -EINVAL;
    }
    switch (request->ibi_type) {
    case I3C_IBI_TARGET_INTR:

        if ((0 == request->payload_len) || (request->payload_len > 5)) {
            LOG_ERR("%s: Invalid IBI SIR payload len (%d)", dev->name, request->payload_len);
            return -EINVAL;
        }

        OSAL_SEM_Pend(&xec_data->xfer_lock, OSAL_WAIT_FOREVER);

        ibi_sir_request.mdb = request->payload[0];
        ibi_sir_request.data_buf = &request->payload[1];
        ibi_sir_request.data_len = (request->payload_len - 1U);

        _drv_pending_xfer_ctxt_init();
        pending_xfer_ctxt.xfer_type = XFER_TYPE_TGT_RAISE_IBI;
        pending_xfer_ctxt.xfer_sem = &xec_data->xfer_sem;
        
//        LOG_DBG("[%s] - Raise IBI SIR", __FUNCTION__);
        I3C_TGT_IBI_SIR_Raise(regs, &ibi_sir_request);

        OSAL_SEM_Post(&xec_data->xfer_lock);

        if (_drv_wait_for_response(&xec_data->xfer_sem)) {
            ret = -EBUSY;
            break;
        } else {
            if (pending_xfer_ctxt.xfer_status) {
                LOG_ERR("!!TGT Raise IBI SIR Error - 0x%08x !!", pending_xfer_ctxt.xfer_status);
                ret = -EIO;
                break;
            }
        }
        break;
    case I3C_IBI_CONTROLLER_ROLE_REQUEST:

        /* We need to wait to process all outstanding responses/data from the
         * Response Queue / Rx-FIFO
         */

        OSAL_SEM_Pend(&xec_data->xfer_lock, OSAL_WAIT_FOREVER);

        _drv_pending_xfer_ctxt_init();
        pending_xfer_ctxt.xfer_type = XFER_TYPE_TGT_RAISE_IBI_MR;
        pending_xfer_ctxt.xfer_sem = &xec_data->xfer_sem;

        LOG_DBG("[%s] - Raise IBI MR", __FUNCTION__);
        I3C_TGT_IBI_MR_Raise(regs);

        OSAL_SEM_Post(&xec_data->xfer_lock);

        if (_drv_wait_for_response(&xec_data->xfer_sem)) {
            ret = -EBUSY;
            break;
        } else {
            if (pending_xfer_ctxt.xfer_status) {
                LOG_ERR("!!TGT Raise IBI MR Error - 0x%08x !!", pending_xfer_ctxt.xfer_status);
                ret = -EIO;
                break;
            } else {

                LOG_DBG("[%s] - Raise IBI MR - Successfully switched role to controller ", __FUNCTION__);
             }
        }

        break;

    case I3C_IBI_HOTJOIN:
        return -ENOTSUP;
        // return _drv_i3c_target_ibi_raise_hj(dev);
    default:
        return -EINVAL;
    }

    return 0;
}

uint64_t _get_pid_from_pid_array(uint8_t *pid_array)
{
    return ((uint64_t)pid_array[0] | ((uint64_t)pid_array[1] << 8) |
            ((uint64_t)pid_array[2] << 16) | ((uint64_t)pid_array[3] << 24) |
            ((uint64_t)pid_array[4] << 32) | ((uint64_t)pid_array[5] << 40));
}

static int _drv_i3c_initiate_hotjoin(const struct device *dev)
{
    struct xec_i3c_data *data = dev->data;
    uint8_t target_info_idx = 0;
    uint8_t free_addr = 0;
    int ret = -1;

    free_addr = i3c_addr_slots_next_free_find(&data->common.attached_dev.addr_slots);

    if (!free_addr) {
        LOG_ERR("%s: no free address available for hot join: 0x%x%", dev->name);
        return ret;
    }

    if (_drv_i3c_targets_free_pos_get(data, &target_info_idx)) {

        /* Unable to find a free location in targets list */
        LOG_ERR("%s: no space in targets list for i3c device (hot join): 0x%x%", dev->name);
        return ret;
    }

    /* Initialize the target info node */
    data->targets[target_info_idx].state = TGT_STATE_NEEDS_DAA;
    data->targets[target_info_idx].address = free_addr;
    data->targets[target_info_idx].pid = 0;

    /* Now that we have created the target info node, proceed to DAA */
    if (DRV_I3C_do_DAA(dev)) {
        /* Unable to retrieve target PID */
        LOG_ERR("%s: DAA for hot join: fail", dev->name);
        return ret;
    }

    return 0;
}

static void _drv_ibi_task(const struct device *dev)
{
    struct xec_i3c_data *xec_data = dev->data;
    struct i3c_dev_attached_list *dev_list = &xec_data->common.attached_dev;
    struct i3c_device_desc *target = NULL;
    uint8_t idx = 0 , ibi_addr = 0;
    OSAL_CRITSECT_DATA_TYPE crit_stat;

    for (idx = 0; idx < MAX_IBI_LIST_COUNT; idx++) {

        if (IBI_NODE_ISR_UPDATED == xec_data->ibis[idx].state) {

            if (I3C_IBI_TARGET_INTR == xec_data->ibis[idx].ibi_type) {
                ibi_addr = xec_data->ibis[idx].addr;
                target = i3c_dev_list_i3c_addr_find(dev_list, ibi_addr);
                if (target != NULL) {
                    /* Inform the application with IBI Payload */
                    (void)target->ibi_cb(target, &xec_data->ibis[idx].payload);
                    /* Note: we are ignoring the return value from this callback
                     * because the hardware will automatically ACK the target which
                     * is expected to send an IBI */
                } else {
                    LOG_ERR("IBI SIR from unknown device %x", ibi_addr);
                }
            } else if (I3C_IBI_HOTJOIN == xec_data->ibis[idx].ibi_type) {

                LOG_DBG("Received HJ request");
                if (_drv_i3c_initiate_hotjoin(dev)) {
                    LOG_ERR("unable to complete DAA for HJ request device 0x%x", ibi_addr);
                }
            } else {
                LOG_DBG("MR from device %x", ibi_addr);
            }
            crit_stat = OSAL_CRIT_Enter(OSAL_CRIT_TYPE_HIGH);
            /* Need to protect this statement with critical section, since
             * is updated in ISR as well  */
            xec_data->ibis[idx].state = IBI_NODE_STATE_FREE;
            OSAL_CRIT_Leave(OSAL_CRIT_TYPE_HIGH, crit_stat);
        }
    }
}

static void _drv_tgt_rx_task(const struct device *dev)
{
    struct xec_i3c_data *xec_data = (struct xec_i3c_data *)dev->data;
    struct xec_i3c_config *config = (struct xec_i3c_config *)dev->config;
    OSAL_CRITSECT_DATA_TYPE crit_stat;
    const struct i3c_target_callbacks *target_cbks;
    struct i3c_tgt_pvt_receive_node *tgt_rx_node;
    uint16_t i;
    uint8_t idx = 0;

    target_cbks = xec_data->target_config->callbacks;
    xec_data->target_config->address = I3C_TGT_dyn_addr_get(config->regs);

    for (idx = 0; idx < MAX_TGT_RX_LIST_COUNT; idx++) {

        tgt_rx_node = &xec_data->tgt_pvt_rx[idx];

        if ((TGT_RX_NODE_ISR_UPDATED == tgt_rx_node->state) ||
            (TGT_RX_NODE_ISR_UPDATED_THR == tgt_rx_node->state)) {

            if (!tgt_rx_node->error_status) {
#ifdef USE_MCHP_H3_CHANGES
                target_cbks->write_received_cb(xec_data->target_config,
                                                &tgt_rx_node->data_buf[0],
                                                tgt_rx_node->data_len);
#else
                /* Inform the application of the received data */
                for (i = 0; i < tgt_rx_node->data_len; i++) {
                    /* Note we are using only the write_received_cb to send all the data
                     * byte by byte as expected by Zephyr Model
                     * write_requested_cb which is used when write is initiated is not used
                     * as we are not supporting ACK/NACK based on application's decision
                     */
                    target_cbks->write_received_cb(xec_data->target_config, tgt_rx_node->data_buf[i]);
                }

                if (TGT_RX_NODE_ISR_UPDATED == tgt_rx_node->state) {

                    /* Inform the end of transaction */
                    target_cbks->stop_cb(xec_data->target_config);
                }
#endif
            } else {
                LOG_ERR("Error status for Target Private Receive 0x%x", tgt_rx_node->error_status);
            }

            crit_stat = OSAL_CRIT_Enter(OSAL_CRIT_TYPE_HIGH);
            /* Need to protect this statement with critical section, since
             * is updated in ISR as well  */
            tgt_rx_node->state = TGT_RX_NODE_STATE_FREE;
            OSAL_CRIT_Leave(OSAL_CRIT_TYPE_HIGH, crit_stat);
        }
    }
}

static void _drv_tgt_tx_done_task(const struct device *dev)
{
    struct xec_i3c_data *xec_data = (struct xec_i3c_data *)dev->data;
    
 #ifdef USE_MCHP_H3_CHANGES   
    const struct i3c_target_callbacks *target_cbks;
    
    target_cbks = xec_data->target_config->callbacks;
    
    target_cbks->tx_done_cb(xec_data->target_config, 
                                xec_data->tgt_pvt_tx_sts, 
                                xec_data->tgt_pvt_tx_rem_data_len);
#endif
    
    xec_data->tgt_pvt_tx_sts = 0x0;
    xec_data->tgt_pvt_tx_rem_data_len = 0x0;

    /* Clear the tx queued flag to allow application to start another
     * target tx
     */
    xec_data->tgt_tx_queued = false;

    /* Keeping this function for possible enhancements later */
}

void DRV_IBI_Task(const struct device *dev)
{
    _drv_ibi_task(dev);
}

void DRV_TGT_RX_Task(const struct device *dev)
{
    _drv_tgt_rx_task(dev);
}

void DRV_TGT_TX_Done_Task(const struct device *dev)
{
    _drv_tgt_tx_done_task(dev);
}

static bool _drv_i3c_ibi_isr(struct i3c_xec_regs *regs, struct xec_i3c_data *data)
{
    uint8_t num_ibis = 0;
    uint8_t i = 0;
    uint32_t ibi_sts = 0;
    uint8_t ibi_addr = 0;
    uint8_t ibi_datalen = 0;
    struct ibi_node *ibi_node_ptr = NULL;
    bool ibi_error = false;

    num_ibis = _i3c_ibi_status_count_get(regs);

    for (i = 0; i < num_ibis; i++)
    {
        ibi_sts = _i3c_ibi_queue_status_get(regs);
        ibi_datalen = IBI_QUEUE_STATUS_DATA_LEN(ibi_sts);
        ibi_addr = IBI_QUEUE_IBI_ADDR(ibi_sts);

//        LOG_DBG("[%s] - ibi_sts = 0x%08x, ibi_addr = 0x%02x ibi_datalen = %d",
//                __FUNCTION__,
//                ibi_sts,
//                ibi_addr,
//                ibi_datalen);

        ibi_node_ptr = _drv_i3c_free_ibi_node_get_isr(data);

        if (ibi_node_ptr)
        {
            if (ibi_datalen)
            {
                if (ibi_datalen <= CONFIG_I3C_IBI_MAX_PAYLOAD_SIZE)
                {
                    ibi_node_ptr->payload.payload_len = ibi_datalen;
                    _i3c_ibi_data_read(regs, &ibi_node_ptr->payload.payload[0], ibi_datalen);
                }
                else
                {
                    LOG_ERR("IBI DataLen > MAX_IBI_PAYLOAD_LEN");
                    ibi_error = true;
                }
            }
            else
            {
                ibi_node_ptr->payload.payload_len = 0;
                LOG_ERR("IBI DataLen 0");
            }

            if (IBI_TYPE_SIRQ(ibi_sts))
            {
//                LOG_DBG("SIRQ IBI received");
                ibi_node_ptr->ibi_type = I3C_IBI_TARGET_INTR;
            }

            if (IBI_TYPE_HJ(ibi_sts))
            {
                LOG_DBG("HOT Join IBI received");
                ibi_node_ptr->ibi_type = I3C_IBI_HOTJOIN;
            }

            if (IBI_TYPE_MR(ibi_sts))
            {
                LOG_DBG("MR IBI received");
                ibi_node_ptr->ibi_type = I3C_IBI_CONTROLLER_ROLE_REQUEST;
            }

            ibi_node_ptr->state = IBI_NODE_ISR_UPDATED;
            ibi_node_ptr->addr = ibi_addr;
//            LOG_DBG("Node updated");
        }
        else
        {
            LOG_ERR("No free IBI nodes");
            ibi_error = true;
        }
    }

    if(ibi_error) {
        /* Drain the IBI Queue for this IBI */
        _i3c_ibi_data_read(regs, NULL, IBI_QUEUE_STATUS_DATA_LEN(ibi_sts));
    }

    return ibi_error;
}
#endif

/**
 * @brief Find a registered I3C target device.
 *
 * This returns the I3C device descriptor of the I3C device
 * matching the incoming @p id.
 *
 * @param dev Pointer to controller device driver instance.
 * @param id Pointer to I3C device ID.
 *
 * @return @see i3c_device_find.
 */
struct i3c_device_desc *DRV_I3C_device_find(const struct device *dev,
                            const struct i3c_device_id *id)
{
    const struct xec_i3c_config *config = dev->config;

    return i3c_dev_list_find(&config->common.dev_list, id);
}

/**
 * @brief Writes to the Target's TX FIFO
 *
 * @param dev Pointer to the device structure for an I3C controller
 *            driver configured in target mode.
 * @param buf Pointer to the buffer
 * @param len Length of the buffer
 *
 * @retval Number of bytes written
 */
int DRV_I3C_target_tx_write(const struct device *dev, uint8_t *buf, uint16_t len)
{
    const struct xec_i3c_config *config = dev->config;
    struct i3c_xec_regs *regs = config->regs;
    struct xec_i3c_data *xec_data = dev->data;
#if I3C_ENABLE_DMA
    struct dma_regs *dma_regs_tx = config->dma_regs_tx;
    uint32_t dataAHBAddress;
    uint8_t device;
#endif    
#if I3C_ENABLE_THRESHOLDS_INTR
    uint16_t rem_data_len = 0;
    uint8_t idx = 0;
#endif

    if (xec_data->tgt_tx_queued) {
        LOG_DBG("Target TX is in progress");
        return -EBUSY;
    }

    xec_data->tgt_tx_queued = true;
    // looks cant increase xec_data->tgt_max_write_len > re-visit it 
    // if (len > xec_data->tgt_max_write_len) {
    //     LOG_DBG("[%s] - Target write data len %d greater than SLV MAX WR LEN %d", __FUNCTION__, len, xec_data->tgt_max_write_len);
    //     len = xec_data->tgt_max_write_len;
    // }
    
#if (I3C_ENABLE_DMA)

    OSAL_SEM_Pend(&xec_data->xfer_lock, OSAL_WAIT_FOREVER);
    
    dataAHBAddress = (uint32_t)&regs->rx_tx_port;
    device = dma_get_device_id(I3C_SEC_HOST_TX, 0);
    dma_setup_tx(dma_regs_tx, device, dataAHBAddress, (uint32_t)buf, len, true); 
    dma_start(dma_regs_tx);  
    I3C_DO_TGT_Xfer(regs, buf, len);
    
    OSAL_SEM_Post(&xec_data->xfer_lock);    

    
    
#elif (I3C_ENABLE_THRESHOLDS_INTR)
    
    if (len > xec_data->fifo_depths.tx_fifo_depth) {

        _drv_pending_xfer_ctxt_init();
        pending_xfer_ctxt.xfer_type = XFER_TYPE_TGT_PVT_RD;
        pending_xfer_ctxt.xfer_sem = &xec_data->xfer_sem;

        pending_xfer_ctxt.node[idx].read = false;
        pending_xfer_ctxt.node[idx].data_buf = buf;
        pending_xfer_ctxt.node[idx].data_len = len;

        pending_xfer_ctxt.node[idx].rem_data_len = len - xec_data->fifo_depths.tx_fifo_depth;
        pending_xfer_ctxt.use_thresholds = true;
        pending_xfer_ctxt.current_xfer_idx = idx;

        rem_data_len = pending_xfer_ctxt.node[idx].rem_data_len;


    } else {
        rem_data_len = 0;
    }

    OSAL_SEM_Pend(&xec_data->xfer_lock, OSAL_WAIT_FOREVER);
    I3C_DO_TGT_Xfer(regs, buf, len, rem_data_len);
    OSAL_SEM_Post(&xec_data->xfer_lock);
    
#else
    
    if (len > xec_data->fifo_depths.tx_fifo_depth) {
        len = 0;
        goto exit_tgt_xfer;
    }
    
    OSAL_SEM_Pend(&xec_data->xfer_lock, OSAL_WAIT_FOREVER);
    I3C_DO_TGT_Xfer(regs, buf, len);
    OSAL_SEM_Post(&xec_data->xfer_lock);
    
#endif

exit_tgt_xfer:
    return len;
}

/**
 * @brief Register itself as target (to the I3C Controller)
 *
 * This tells the controller to act as a target device
 * on the I3C bus.
 *
 * @param dev Pointer to target device driver instance.
 * @param cfg Config struct with functions and parameters used by the I3C driver
 * to send bus events
 *
 * @return @see i3c_device_find.
 */
int DRV_I3C_target_register(const struct device *dev, struct i3c_target_config *cfg)
{
    struct xec_i3c_data *data = dev->data;

    data->target_config = cfg;
    return 0;
}

/**
 * @brief Unregisters the provided config as Target device
 *
 * This tells the controller to stop acting as a target device
 * on the I3C bus.
 *
 * @param dev Pointer to target device driver instance.
 * @param cfg I3C target device configuration
 *
 */
int DRV_I3C_target_unregister(const struct device *dev, struct i3c_target_config *cfg)
{
    struct xec_i3c_data *data = dev->data;

    if (cfg == data->target_config) {
        data->target_config = NULL;
    }
    return 0;
}

/**
 * @brief Configure I3C hardware.
 *
 * @param dev Pointer to controller device driver instance.
 * @param type Type of configuration parameters being passed
 *             in @p config.
 * @param config Pointer to the configuration parameters.
 *
 * @retval 0 If successful.
 * @retval -EINVAL If invalid configure parameters.
 * @retval -EIO General Input/Output errors.
 * @retval -ENOSYS If not implemented.
 */
int DRV_I3C_configure(const struct device *dev, enum i3c_config_type type, void *config)
{
    const struct xec_i3c_config *xec_config = dev->config;
    struct xec_i3c_data *xec_data = dev->data;
    struct i3c_xec_regs *regs = xec_config->regs;

    struct i3c_config_controller *ctrl_cfg;
    struct i3c_config_target *tgt_cfg;

    if (I3C_CONFIG_TARGET == type) {
        /* Ensure i3c instance is not in controller mode */
        if(true == I3C_Is_Current_Role_Master(regs)) {
            return -EINVAL;
        }

        tgt_cfg = (struct i3c_config_target *)config;
        I3C_TGT_PID_set(regs, tgt_cfg->pid, tgt_cfg->pid_random);

    } else if (I3C_CONFIG_CONTROLLER == type) {
        /* Ensure i3c instance is controller mode */
        if(false == I3C_Is_Current_Role_Master(regs)) {
            return -EINVAL;
        }

        ctrl_cfg = (struct i3c_config_controller *)config;

        if ((ctrl_cfg->scl.i2c == 0U) || (ctrl_cfg->scl.i3c == 0U)) {
           return -EINVAL;
        }
    }

    return 0;
}

static void _drv_i3c_isr_xfers(struct i3c_xec_regs *regs, uint16_t num_responses)
{
    uint16_t data_len = 0, data_buf_idx = 0, read_data_len = 0;
    uint8_t resp_sts = 0;
    uint8_t tid = 0;

    /* Note: We are handling multiple responses only for chained private xfers */

    for (int i=0; i< num_responses; i++) {

        resp_sts = _i3c_response_sts_get(regs, &data_len, &tid);
        pending_xfer_ctxt.node[i].error_status = resp_sts;
        pending_xfer_ctxt.node[i].ret_data_len = data_len;

        //LOG_DBG("[%s] - tid = %d, resp_sts = 0x%08x data_len = %d", __FUNCTION__, tid, resp_sts, data_len);

        /* Ensure TID of response match pending transfer */
        if (tid == pending_xfer_ctxt.node[i].tid) {

            if ((!resp_sts) && data_len) /* Read response bytes from Fifo */
            {
                if (pending_xfer_ctxt.node[i].read) {
                    //LOG_DBG("[%s] - Reading [%d] bytes into [0x%08x]", __FUNCTION__, data_len, pending_xfer_ctxt.node[i].data_buf);
#if  I3C_ENABLE_THRESHOLDS_INTR                   
                    if (pending_xfer_ctxt.node[i].read_iter_data_len) {

                        read_data_len = pending_xfer_ctxt.node[i].read_iter_data_len;

                        data_buf_idx = pending_xfer_ctxt.node[i].data_len - pending_xfer_ctxt.node[i].rem_data_len;
                        _i3c_fifo_read(regs, &pending_xfer_ctxt.node[i].data_buf[data_buf_idx], read_data_len);
                        pending_xfer_ctxt.node[i].read_iter_data_len = 0;

                    } else {
                        _i3c_fifo_read(regs, pending_xfer_ctxt.node[i].data_buf, data_len);
                    }
#elif (!I3C_ENABLE_DMA)
//#else
                    _i3c_fifo_read(regs, pending_xfer_ctxt.node[i].data_buf, data_len);
#endif

                } else {
                    LOG_ERR("Read data encountered with no matching read request");
                }
            }
        } else {
            LOG_ERR("TID match error - need to investigate");
        }
    }

    pending_xfer_ctxt.xfer_status = 0;
    for (int i=0; i< num_responses; i++) {

        switch(pending_xfer_ctxt.node[i].error_status)
        {
            case RESPONSE_ERROR_PARITY:
                LOG_ERR("RESPONSE_ERROR_PARITY");
                break;
            case RESPONSE_ERROR_IBA_NACK:
                LOG_ERR("RESPONSE_ERROR_IBA_NACK");
                break;
            case RESPONSE_ERROR_TRANSF_ABORT:
                LOG_ERR("RESPONSE_ERROR_TRANSF_ABORT");
                break;
            case RESPONSE_ERROR_CRC:
                LOG_ERR("RESPONSE_ERROR_CRC");
                break;
            case RESPONSE_ERROR_FRAME:
                LOG_ERR("RESPONSE_ERROR_FRAME");
                break;
            case RESPONSE_ERROR_OVER_UNDER_FLOW:
                LOG_ERR("RESPONSE_ERROR_OVER_UNDER_FLOW");
                break;
            case RESPONSE_ERROR_I2C_W_NACK_ERR:
                LOG_ERR("RESPONSE_ERROR_I2C_W_NACK_ERR");
                break;
            case RESPONSE_ERROR_ADDRESS_NACK:
                LOG_ERR("RESPONSE_ERROR_ADDRESS_NACK");
                break;
            case RESPONSE_NO_ERROR:
            default:
                break;
        }

        if (pending_xfer_ctxt.node[i].error_status) {
            /* Mark as Transaction error */
            pending_xfer_ctxt.xfer_status = pending_xfer_ctxt.node[i].error_status;
            break;
        }
    }

    if (pending_xfer_ctxt.xfer_status) { /* Error Handling */
        I3C_Xfer_Error_Resume(regs);
    } else {
        /* No Error */
    }

    OSAL_SEM_PostISR(pending_xfer_ctxt.xfer_sem);
}

static bool _drv_i3c_isr_target_xfers(const struct device *dev, uint16_t num_responses, uint16_t *tgt_event)
{   
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    struct i3c_tgt_pvt_receive_node *tgt_rx_node;
    struct dma_regs *dma_regs_rx = config->dma_regs_rx;
    struct dma_regs *dma_regs_tx = config->dma_regs_tx;
    uint16_t data_len = 0;
    uint8_t resp_sts = 0;
    uint8_t tid = 0;
    bool tgt_receive = false; /* Flag to indicate Receive Xfer */
    bool notify_app = false;

    for (int i=0; i< num_responses; i++) { /*Note: We are expecting only one response in the ISR */

        resp_sts = _i3c_tgt_response_sts_get(regs, &data_len, &tid, &tgt_receive);

        LOG_DBG("[%s] - tid = %d, resp_sts = 0x%08x data_len = %d", __FUNCTION__, tid, resp_sts, data_len);
        
        if (tgt_receive) {

#if I3C_ENABLE_DMA             
            dma_stop(dma_regs_rx);
#endif            
            
            if (RESPONSE_TID_DEFSLVS == tid)  { /* Response for DEFSLVS */

                if (data_len <= data->DAT_depth) {

                    LOG_DBG("[%s] - DEFSLVS response: no of targets %d", __FUNCTION__, data_len);
                    I3C_TGT_DEFSLVS_DAT_write(regs, data->DCT_start_addr, data->DAT_start_addr, data_len);
                } else {
                    LOG_DBG("[%s] - DEFSLVS response: no of targets %d > DAT Depth %d", __FUNCTION__, data_len, data->DAT_depth);
                }

            } else { /* Private Receive Transfer - Controller Write */
                
#if I3C_ENABLE_DMA   
                tgt_rx_node = _drv_i3c_dma_in_use_tgt_rx_node_get_isr(data);
#else
                tgt_rx_node = _drv_i3c_free_tgt_rx_node_get_isr(data, false);
                
#endif   

                if (tgt_rx_node) {
                    tgt_rx_node->error_status = resp_sts;
                    tgt_rx_node->data_len = data_len;
                    // looks cant increase data->tgt_max_read_len > re-visit it
                    // if (data_len > data->tgt_max_read_len) {
                    //     LOG_DBG("[%s] - Received data len %d greater than SLV MAX RD LEN %d", __FUNCTION__, data_len, data->tgt_max_read_len);
                    // }
#if (!I3C_ENABLE_DMA)
                    if ((!resp_sts) && data_len) { /* Read response bytes from Fifo */
                        LOG_DBG("[%s] - Reading [%d] bytes into [0x%08x]", __FUNCTION__, data_len, tgt_rx_node->data_buf);
                        _i3c_fifo_read(regs, tgt_rx_node->data_buf, data_len);
                    }
#endif                    

                    tgt_rx_node->state = TGT_RX_NODE_ISR_UPDATED;
                    *tgt_event = DRV_EVENT_BIT_HANDLE_TGT_RX;
                    notify_app = true;
                    LOG_DBG("Node updated");

                    if (resp_sts) {
                        I3C_TGT_Error_Recovery(regs, resp_sts);
                        /* Controller is expected to issue GETSTATUS CCC to clear
                         * error status from CCC_DEVICE_STATUS register
                         */
#if I3C_ENABLE_DMA 
                        _drv_i3c_dma_target_rx_enable(dev);
#endif                         
                        break; //break out of the for loop
                    } 
#if I3C_ENABLE_DMA 
                    else {
                        _drv_i3c_dma_target_rx_enable(dev);
                    }
#endif                    

                } else {
                    LOG_ERR("Target RX Node Unavailable");
                }
            }

        } else { /* Private Write Transfer - Controller Read */
            
            
#if I3C_ENABLE_DMA             
            dma_stop(dma_regs_tx);
#endif             

            /* Do we need to match TID? */
            
            data->tgt_pvt_tx_rem_data_len = data_len;
            data->tgt_pvt_tx_sts = resp_sts;
            
            /* Prepare for next Target TX */
            *tgt_event = DRV_EVENT_BIT_HANDLE_TGT_TX_DONE;
            notify_app = true;
                        
            if ((resp_sts) || (data_len != 0)) {                    
                    I3C_TGT_Error_Recovery(regs, resp_sts);
                    /* Controller is expected to issue GETSTATUS CCC to clear
                     * error status from CCC_DEVICE_STATUS register
                     */
                    break; //break out of the for loop
            }
        }
    }

    return notify_app;
}

#if I3C_ENABLE_THRESHOLDS_INTR
static void _drv_i3c_isr_threshold_xfers(struct i3c_xec_regs *regs, bool rx_flag)
{
    uint16_t tx_fifo_fill_len = 0, rx_fifo_read_len = 0;
    uint16_t data_buf_idx = 0;
    uint8_t xfer_idx = 0;

    if (pending_xfer_ctxt.use_thresholds) {

        xfer_idx = pending_xfer_ctxt.current_xfer_idx;

        if (rx_flag) {

                rx_fifo_read_len = pending_xfer_ctxt.node[xfer_idx].read_iter_data_len;

                data_buf_idx = pending_xfer_ctxt.node[xfer_idx].data_len - pending_xfer_ctxt.node[xfer_idx].rem_data_len;

                pending_xfer_ctxt.node[xfer_idx].rem_data_len  -= rx_fifo_read_len;

                if (pending_xfer_ctxt.node[xfer_idx].rem_data_len > THRESHOLD_SIZE) {
                    pending_xfer_ctxt.node[xfer_idx].read_iter_data_len = THRESHOLD_SIZE;
                } else {
                    pending_xfer_ctxt.node[xfer_idx].read_iter_data_len = pending_xfer_ctxt.node[xfer_idx].rem_data_len;
                    pending_xfer_ctxt.use_thresholds = false;
                    _i3c_intr_thresholds_rx_disable(regs);
                }

                _i3c_fifo_read(regs, &pending_xfer_ctxt.node[xfer_idx].data_buf[data_buf_idx], rx_fifo_read_len);

        } else {

            if (pending_xfer_ctxt.node[xfer_idx].rem_data_len >= THRESHOLD_SIZE) {
                tx_fifo_fill_len = THRESHOLD_SIZE;
            } else {
                tx_fifo_fill_len = pending_xfer_ctxt.node[xfer_idx].rem_data_len;
            }

            data_buf_idx = pending_xfer_ctxt.node[xfer_idx].data_len - pending_xfer_ctxt.node[xfer_idx].rem_data_len;

            pending_xfer_ctxt.node[xfer_idx].rem_data_len  -= tx_fifo_fill_len;

            if (!pending_xfer_ctxt.node[xfer_idx].rem_data_len) {
                pending_xfer_ctxt.use_thresholds = false;
                _i3c_intr_thresholds_tx_disable(regs);
            }

            _i3c_fifo_write(regs, &pending_xfer_ctxt.node[xfer_idx].data_buf[data_buf_idx], tx_fifo_fill_len);

        }
    }

}

static bool _drv_i3c_isr_tgt_threshold_xfers(struct i3c_xec_regs *regs, struct xec_i3c_data *data, bool rx_flag, uint16_t *tgt_event)
{
    struct i3c_tgt_pvt_receive_node *tgt_rx_node;
    uint16_t tx_fifo_fill_len = 0;
    uint16_t data_buf_idx = 0;
    uint8_t xfer_idx = 0;
    bool notify_app = false;

    if (pending_xfer_ctxt.use_thresholds) {

        xfer_idx = pending_xfer_ctxt.current_xfer_idx;

        if (rx_flag) {

                tgt_rx_node = _drv_i3c_free_tgt_rx_node_get_isr(data, false);

                if (tgt_rx_node) {
                    tgt_rx_node->error_status = 0;
                    tgt_rx_node->data_len = THRESHOLD_SIZE;

                    if (tgt_rx_node->data_len > data->tgt_max_read_len) {
                        //LOG_DBG("[%s] - Received data len %d greater than SLV MAX RD LEN %d", __FUNCTION__, tgt_rx_node->data_len, data->tgt_max_read_len);
                    }
                    _i3c_fifo_read(regs, tgt_rx_node->data_buf, tgt_rx_node->data_len);

                    tgt_rx_node->state = TGT_RX_NODE_ISR_UPDATED_THR;
                    *tgt_event = DRV_EVENT_BIT_HANDLE_TGT_RX;
                    notify_app = true;
                    //LOG_DBG("Node updated");

                } else {
                    LOG_ERR("Target RX Node Unavailable");
                }               

        } else {

            if (pending_xfer_ctxt.node[xfer_idx].rem_data_len >= THRESHOLD_SIZE) {
                tx_fifo_fill_len = THRESHOLD_SIZE;
            } else {
                tx_fifo_fill_len = pending_xfer_ctxt.node[xfer_idx].rem_data_len;
            }

            data_buf_idx = pending_xfer_ctxt.node[xfer_idx].data_len - pending_xfer_ctxt.node[xfer_idx].rem_data_len;

            pending_xfer_ctxt.node[xfer_idx].rem_data_len  -= tx_fifo_fill_len;

            if (!pending_xfer_ctxt.node[xfer_idx].rem_data_len) {
                pending_xfer_ctxt.use_thresholds = false;
                _i3c_intr_thresholds_tx_disable(regs);
            }

            _i3c_fifo_write(regs, &pending_xfer_ctxt.node[xfer_idx].data_buf[data_buf_idx], tx_fifo_fill_len);
        }
    }

    return notify_app;

}
#endif

static bool _drv_i3c_isr_target(const struct device *dev, uint32_t intr_sts, uint16_t *tgt_event)
{
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    uint8_t ibi_sir_rem_datalen = 0;
    uint16_t num_responses = 0;
    bool notify_app = false;
    
#if I3C_ENABLE_THRESHOLDS_INTR    
    if (intr_sts & sbit_TX_THLD_STS) {
        _drv_i3c_isr_tgt_threshold_xfers(regs, data, false, tgt_event);
    }

    if (intr_sts & sbit_RX_THLD_STS) {
        notify_app = _drv_i3c_isr_tgt_threshold_xfers(regs, data, true, tgt_event);
        if (notify_app) {
            /* Exit from target processing to inform app; ISR should fire again
             * if there are more pending events for target */
            return notify_app;
        }
    }
#endif

    /* Get the number of responses in Response Queue */
    num_responses = _i3c_resp_buf_level_get(regs);
//    LOG_DBG("[%s] - num_responses = %d", __FUNCTION__, num_responses);

    if (num_responses) {
        notify_app = _drv_i3c_isr_target_xfers(dev, num_responses, tgt_event);
    }

    if(intr_sts & sbit_IBI_UPDATED_STS) {
//        LOG_DBG("[%s] IBI updated status", __FUNCTION__);

        /* Ensure there is corresponding pending context */
        if ((XFER_TYPE_TGT_RAISE_IBI == pending_xfer_ctxt.xfer_type)
            || (XFER_TYPE_TGT_RAISE_IBI_MR == pending_xfer_ctxt.xfer_type)) {

            pending_xfer_ctxt.xfer_status = 1;
            if (_i3c_tgt_ibi_resp_get(regs, &ibi_sir_rem_datalen)) {
                pending_xfer_ctxt.xfer_status = 0;
            } else {
                LOG_DBG("[%s] Target Raise IBI SIR error, ibi_sir_rem_datalen = %d", __FUNCTION__, ibi_sir_rem_datalen);
            }

            if (pending_xfer_ctxt.xfer_status && ibi_sir_rem_datalen) { /* Error Handling */
                LOG_DBG("[%s] Handle Target Raise IBI SIR Residual data", __FUNCTION__);
                I3C_TGT_IBI_SIR_Residual_handle(regs);
            } else {
                /* No Error */
            }

            if (XFER_TYPE_TGT_RAISE_IBI == pending_xfer_ctxt.xfer_type) {
                OSAL_SEM_PostISR(pending_xfer_ctxt.xfer_sem);
            }
            else if ((XFER_TYPE_TGT_RAISE_IBI_MR == pending_xfer_ctxt.xfer_type) &&
                     pending_xfer_ctxt.xfer_status) {
                OSAL_SEM_PostISR(pending_xfer_ctxt.xfer_sem);
            }

        } else {
            LOG_DBG("[%s] IBI Updated Sts without raising IBI ??", __FUNCTION__);
        }
    }

    if(intr_sts & sbit_CCC_UPDATED_STS) {
        LOG_DBG("[%s] CCC updated by master", __FUNCTION__);
        /* Check and update MRL, MWL */
        I3C_Target_MRL_MWL_update(regs, &data->tgt_max_read_len, &data->tgt_max_write_len);
    }

    if(intr_sts & sbit_DYN_ADDR_ASSIGN_STS) {
        if(true == I3C_TGT_is_dyn_addr_valid(regs)) {
            LOG_DBG("[%s] DA assigned by master", __FUNCTION__);
        } else {
            LOG_DBG("[%s] DA reset by master", __FUNCTION__);
        }
    }

    if(intr_sts & sbit_DEFSLV_STS) {
        LOG_DBG("[%s] DEFSLV CCC sent by master", __FUNCTION__);
    }

    if(intr_sts & sbit_READ_REQ_RECV_STS) {
        LOG_DBG("[%s] READ_REQ_RECV_STS No valid command in command Q", __FUNCTION__);
    }

    if(intr_sts & sbit_BUSOWNER_UPDATED_STS) {
        LOG_DBG("[%s] TGT: Bus owner was changed", __FUNCTION__);

        /* Bus Owner has changed; flush all fifos and queues and program resume bit */
        I3C_TGT_RoleSwitch_Resume(regs);

        /* Ensure there is corresponding pending context to inform the raise IBI API */
        if ((XFER_TYPE_TGT_RAISE_IBI_MR == pending_xfer_ctxt.xfer_type) && (!pending_xfer_ctxt.xfer_status)) {
                OSAL_SEM_PostISR(pending_xfer_ctxt.xfer_sem);
        }

    }

    return notify_app;
}

static bool _drv_i3c_isr_controller(const struct device *dev, uint32_t intr_sts, uint16_t *tgt_event)
{
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    uint16_t num_responses = 0;
    bool notify_app = false;
    
#if I3C_ENABLE_THRESHOLDS_INTR    
    if (intr_sts & sbit_TX_THLD_STS) {
        _drv_i3c_isr_threshold_xfers(regs, false);
    }

    if (intr_sts & sbit_RX_THLD_STS) {
        _drv_i3c_isr_threshold_xfers(regs, true);
    }
#endif

    /* Get the number of responses in Response Queue */
    num_responses = _i3c_resp_buf_level_get(regs);
    //LOG_DBG("[%s] - num_responses = %d", __FUNCTION__, num_responses);

    if (num_responses) {
        _drv_i3c_isr_xfers(regs, num_responses);
    }
#ifdef CONFIG_I3C_USE_IBI
    if (intr_sts & sbit_IBI_THLD_STS) {
        if(false != _drv_i3c_ibi_isr(regs, data)) {
            LOG_ERR("[%s] - Error handling IBI", __FUNCTION__);
        } else {
//            LOG_DBG("[%s] - Schedule IBI Task", __FUNCTION__);
            notify_app = true;
            *tgt_event = DRV_EVENT_BIT_HANDLE_IBI;
        }
    }
#endif

    if(intr_sts & sbit_BUSOWNER_UPDATED_STS) {
        LOG_DBG("[%s] CNTRLR: Bus owner was changed", __FUNCTION__);
    }

    return notify_app;
}

/**
 * @brief Interrupt Service Routine
 *
 * @see DRV_I3C_ISR_Callback
 *
 * @param dev Pointer to controller device driver instance.
 * @param payload Pointer to CCC payload.
 *
 * @return @see i3c_do_ccc
 */
static void DRV_I3C_ISR_Callback(uintptr_t context)
{
    const struct device *dev = (const struct device *)context;
    const struct xec_i3c_config *config = dev->config;
    struct xec_i3c_data *data = dev->data;
    struct i3c_xec_regs *regs = config->regs;
    uint32_t intr_sts = 0;
    uint16_t tgt_event = 0;
    TASK1_DATA *task1_ctxt = NULL;
    TASK2_DATA *task2_ctxt = NULL;
    bool notify_app = false;
    bool task1_task = false;
    //volatile uint32_t present_state_sts = 0;
    
    intr_sts = _i3c_intr_sts_get(regs);
    //LOG_DBG("[%s] - START Read intr_sts = 0x%08x", __FUNCTION__, intr_sts);
    _i3c_intr_sts_clear(regs, intr_sts);
    //LOG_DBG("[%s] - START Cleared intr_sts = 0x%08x", __FUNCTION__, intr_sts);
    
    //present_state_sts = regs->present_state;
    //LOG_DBG("[%s] - present_state_sts = 0x%08x", __FUNCTION__, present_state_sts);
    
    /* Invoke target ISR function if we are acting as target */
    if(false == I3C_Is_Current_Role_Master(regs)) {
        notify_app = _drv_i3c_isr_target(dev, intr_sts, &tgt_event);
    } else {
        notify_app = _drv_i3c_isr_controller(dev, intr_sts, &tgt_event);
        task1_task = true;
    }

    if (notify_app) {
        if (task1_task) {
            task1_ctxt = get_task1_context();
            set_event_from_isr(&task1_ctxt->events, tgt_event);
        } else {
            task2_ctxt = get_task2_context();
            set_event_from_isr(&task2_ctxt->events, tgt_event);
        }        
        OSAL_SEM_Post(&data->events_sem);
    }

    intr_sts = _i3c_intr_sts_get(regs);
    //LOG_DBG("[%s] - END Read intr_sts = 0x%08x", __FUNCTION__, intr_sts);
    _i3c_intr_sts_clear(regs, intr_sts);
    //LOG_DBG("[%s] - END Cleared intr_sts = 0x%08x", __FUNCTION__, intr_sts);
}