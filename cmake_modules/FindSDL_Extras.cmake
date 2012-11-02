#if the headers are not installed, the newer apis won't be activated

#find which version of SDL_mixer we have (for Mix_Init)
find_file(sdlmixer_h SDL_mixer.h ${SDLMIXER_INCLUDE_DIR})
if(sdlmixer_h)
    file(STRINGS ${sdlmixer_h} sdlmixer_majorversion_tmp REGEX "SDL_MIXER_MAJOR_VERSION[\t' ']+[0-9]+")
    file(STRINGS ${sdlmixer_h} sdlmixer_minorversion_tmp REGEX "SDL_MIXER_MINOR_VERSION[\t' ']+[0-9]+")
    file(STRINGS ${sdlmixer_h} sdlmixer_patchversion_tmp REGEX "SDL_MIXER_PATCHLEVEL[\t' ']+[0-9]+")
    string(REGEX MATCH ".([0-9]+)" sdlmixer_majorversion "${sdlmixer_majorversion_tmp}")
    string(REGEX MATCH ".([0-9]+)" sdlmixer_minorversion "${sdlmixer_minorversion_tmp}")
    string(REGEX MATCH ".([0-9]+)" sdlmixer_patchversion "${sdlmixer_patchversion_tmp}")
    math(EXPR sdlmixer_version "${sdlmixer_majorversion}*10000 + ${sdlmixer_minorversion}*100 + ${sdlmixer_patchversion}")

    if(sdlmixer_version GREATER "10209")
        message(STATUS "Mix_Init() is present")
        set(pascal_flags "-dSDL_MIXER_NEWER" ${pascal_flags})
    endif()
endif()

#find which version of SDL_image we have (for IMG_Init)
find_file(sdlimage_h SDL_image.h ${SDLIMAGE_INCLUDE_DIR})
if(sdlimage_h)
    file(STRINGS ${sdlimage_h} sdlimage_majorversion_tmp REGEX "SDL_IMAGE_MAJOR_VERSION[\t' ']+[0-9]+")
    file(STRINGS ${sdlimage_h} sdlimage_minorversion_tmp REGEX "SDL_IMAGE_MINOR_VERSION[\t' ']+[0-9]+")
    file(STRINGS ${sdlimage_h} sdlimage_patchversion_tmp REGEX "SDL_IMAGE_PATCHLEVEL[\t' ']+[0-9]+")
    string(REGEX MATCH ".([0-9]+)" sdlimage_majorversion "${sdlimage_majorversion_tmp}")
    string(REGEX MATCH ".([0-9]+)" sdlimage_minorversion "${sdlimage_minorversion_tmp}")
    string(REGEX MATCH ".([0-9]+)" sdlimage_patchversion "${sdlimage_patchversion_tmp}")
    math(EXPR sdlimage_version "${sdlimage_majorversion}*10000 + ${sdlimage_minorversion}*100 + ${sdlimage_patchversion}")

    if(sdlimage_version GREATER "010207")
        message(STATUS "IMG_Init() is present")
        set(pascal_flags "-dSDL_IMAGE_NEWER" ${pascal_flags})
    endif()
endif()

