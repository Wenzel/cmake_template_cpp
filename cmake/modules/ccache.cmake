# find ccache
find_program(ccache_path ccache)
# ${VAR}-NOTFOUND is set if not found
if (NOT DEFINED ccache_path-NOTFOUND)
    SET_PROPERTY(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)

    SET_PROPERTY(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
endif()
