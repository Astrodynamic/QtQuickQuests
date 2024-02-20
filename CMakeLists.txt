cmake_minimum_required(VERSION 3.21)

project(QtQuickQuests VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 6.7 REQUIRED COMPONENTS
    Quick
    QuickControls2
)

qt_standard_project_setup(REQUIRES 6.7)

qt_add_executable(${PROJECT_NAME}
    src/main.cc
)

qt_add_qml_module(${PROJECT_NAME}
    URI ${PROJECT_NAME}_Module
    VERSION 1.0
    QML_FILES
        modules/Main.qml
)

qt_add_resources(${PROJECT_NAME} "controls"
    PREFIX "/"
    BASE configuration
    FILES
        configuration/qtquickcontrols2.conf
)

target_compile_features(${PROJECT_NAME}
  PUBLIC
  cxx_std_20
)

target_compile_options(
    ${PROJECT_NAME}
    PRIVATE

    -Wall
    -Werror
    -Wextra
    -Wpedantic
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    Qt6::Quick
    Qt6::QuickControls2
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
