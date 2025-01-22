

# aux_source_directory(. SRC_LIST)

# Create dynamic library
# add_library(ps8833_share SHARED ps8833.c)
# Create static library
add_library(ps8833_static STATIC ps8833.c)
add_library(ps8833_lib STATIC IMPORTED GLOBAL)

# Rename ps8833_share to lib_ps8833.so
# set_target_properties(ps8833_share PROPERTIES OUTPUT_NAME "ps8833")
# Rename ps8833_static to lib_ps8833.a
set_target_properties(ps8833_static PROPERTIES OUTPUT_NAME "ps8833")

# Set output directory
set(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)


# ========================
# target_sources(app PRIVATE ps8833.c)

# ========================
