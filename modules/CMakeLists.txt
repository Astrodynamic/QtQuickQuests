add_subdirectory(Basic)
add_subdirectory(Components)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    BasicLibplugin
)
