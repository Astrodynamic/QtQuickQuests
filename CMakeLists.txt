cmake_minimum_required(VERSION 3.21)

project(QtQuickQuests VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 6.5 REQUIRED COMPONENTS
    Quick
)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(${PROJECT_NAME}
    src/main.cc
)

qt_add_resources(${PROJECT_NAME} "icon"
    PREFIX "/"
    # BASE data/icon
    FILES
        # data/icon/appicon.png
        ./appicon.png
)

qt_add_qml_module(${PROJECT_NAME}
    URI ${PROJECT_NAME}_Main
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

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(${PROJECT_NAME} PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.${PROJECT_NAME}
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(${PROJECT_NAME}
    PRIVATE
    Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
