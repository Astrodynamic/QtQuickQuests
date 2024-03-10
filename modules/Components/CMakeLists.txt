add_subdirectory(Cobot)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    CobotLibplugin
)
