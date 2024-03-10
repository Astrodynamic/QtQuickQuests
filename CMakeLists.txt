cmake_minimum_required(VERSION 3.21)

project(QtQuickQuests VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 6.7 REQUIRED COMPONENTS
    Quick
    QuickControls2
    LinguistTools
    VirtualKeyboard
)

qt_standard_project_setup(REQUIRES 6.7)

qt_add_executable(${PROJECT_NAME}
    src/main.cc
)

qt_add_resources(${PROJECT_NAME} "configuration"
    PREFIX "/"
    BASE assets/configuration
    FILES
        assets/configuration/qtquickcontrols2.conf
)

qt_add_translations(${PROJECT_NAME}
    TS_FILES
        assets/translations/i18n_ru.ts
        assets/translations/i18n_en.ts
    LUPDATE_OPTIONS
        -no-obsolete
    LRELEASE_OPTIONS
        -compress
        -nounfinished
        -removeidentical
)

target_compile_features(${PROJECT_NAME}
  PUBLIC
  cxx_std_20
)

target_compile_definitions(${PROJECT_NAME}
    PRIVATE
    PROJECT_NAME="${PROJECT_NAME}"
    PROJECT_VERSION="${PROJECT_VERSION}"
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
)

include(GNUInstallDirs)
install(TARGETS ${PROJECT_NAME}
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)

include(cmake/qmlmodules.cmake)
