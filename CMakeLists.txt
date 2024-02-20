cmake_minimum_required(VERSION 3.21)

project(QtQuickQuests VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 6.7 REQUIRED COMPONENTS
    Quick
    QuickControls2
    LinguistTools
    VirtualKeyboard
)

qt_standard_project_setup(REQUIRES 6.7)

set(QML_IMPORT_PATH
    ${CMAKE_SOURCE_DIR}/modules
    ${CMAKE_BINARY_DIR}/modules
    CACHE STRING "" FORCE
)

qt_add_executable(${PROJECT_NAME}
    src/main.cc
)

qt_add_qml_module(${PROJECT_NAME}
    URI ${PROJECT_NAME}_Module
    VERSION 1.0
    RESOURCE_PREFIX /astrodynamic.com/imports
    QML_FILES
        modules/Main.qml
)

add_subdirectory(modules/Basic)

qt_add_resources(${PROJECT_NAME} "controls"
    PREFIX "/"
    BASE configuration
    FILES
        configuration/qtquickcontrols2.conf
)

qt_add_translations(${PROJECT_NAME}
    TS_FILES
        data/translations/i18n_ru.ts
        data/translations/i18n_en.ts
    LUPDATE_OPTIONS
        -no-obsolete
    LRELEASE_OPTIONS
        -compress
        -nounfinished
        -removeidentical
)
add_dependencies(${PROJECT_NAME} update_translations)

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
    Qt6::VirtualKeyboard

    BasicLibplugin
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
