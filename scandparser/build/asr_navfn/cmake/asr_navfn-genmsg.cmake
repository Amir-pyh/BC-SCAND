# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "asr_navfn: 0 messages, 2 services")

set(MSG_I_FLAGS "-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg;-Igeometry_msgs:/opt/ros/noetic/share/geometry_msgs/cmake/../msg;-Inav_msgs:/opt/ros/noetic/share/nav_msgs/cmake/../msg;-Iactionlib_msgs:/opt/ros/noetic/share/actionlib_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(asr_navfn_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv" NAME_WE)
add_custom_target(_asr_navfn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "asr_navfn" "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv" "geometry_msgs/Quaternion:std_msgs/Header:geometry_msgs/Pose:geometry_msgs/Point:geometry_msgs/PoseStamped"
)

get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv" NAME_WE)
add_custom_target(_asr_navfn_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "asr_navfn" "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages

### Generating Services
_generate_srv_cpp(asr_navfn
  "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/asr_navfn
)
_generate_srv_cpp(asr_navfn
  "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/asr_navfn
)

### Generating Module File
_generate_module_cpp(asr_navfn
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/asr_navfn
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(asr_navfn_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(asr_navfn_generate_messages asr_navfn_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv" NAME_WE)
add_dependencies(asr_navfn_generate_messages_cpp _asr_navfn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv" NAME_WE)
add_dependencies(asr_navfn_generate_messages_cpp _asr_navfn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(asr_navfn_gencpp)
add_dependencies(asr_navfn_gencpp asr_navfn_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS asr_navfn_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages

### Generating Services
_generate_srv_eus(asr_navfn
  "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/asr_navfn
)
_generate_srv_eus(asr_navfn
  "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/asr_navfn
)

### Generating Module File
_generate_module_eus(asr_navfn
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/asr_navfn
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(asr_navfn_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(asr_navfn_generate_messages asr_navfn_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv" NAME_WE)
add_dependencies(asr_navfn_generate_messages_eus _asr_navfn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv" NAME_WE)
add_dependencies(asr_navfn_generate_messages_eus _asr_navfn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(asr_navfn_geneus)
add_dependencies(asr_navfn_geneus asr_navfn_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS asr_navfn_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages

### Generating Services
_generate_srv_lisp(asr_navfn
  "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/asr_navfn
)
_generate_srv_lisp(asr_navfn
  "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/asr_navfn
)

### Generating Module File
_generate_module_lisp(asr_navfn
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/asr_navfn
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(asr_navfn_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(asr_navfn_generate_messages asr_navfn_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv" NAME_WE)
add_dependencies(asr_navfn_generate_messages_lisp _asr_navfn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv" NAME_WE)
add_dependencies(asr_navfn_generate_messages_lisp _asr_navfn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(asr_navfn_genlisp)
add_dependencies(asr_navfn_genlisp asr_navfn_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS asr_navfn_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages

### Generating Services
_generate_srv_nodejs(asr_navfn
  "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/asr_navfn
)
_generate_srv_nodejs(asr_navfn
  "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/asr_navfn
)

### Generating Module File
_generate_module_nodejs(asr_navfn
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/asr_navfn
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(asr_navfn_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(asr_navfn_generate_messages asr_navfn_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv" NAME_WE)
add_dependencies(asr_navfn_generate_messages_nodejs _asr_navfn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv" NAME_WE)
add_dependencies(asr_navfn_generate_messages_nodejs _asr_navfn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(asr_navfn_gennodejs)
add_dependencies(asr_navfn_gennodejs asr_navfn_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS asr_navfn_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages

### Generating Services
_generate_srv_py(asr_navfn
  "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv"
  "${MSG_I_FLAGS}"
  "/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Quaternion.msg;/opt/ros/noetic/share/std_msgs/cmake/../msg/Header.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Pose.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/Point.msg;/opt/ros/noetic/share/geometry_msgs/cmake/../msg/PoseStamped.msg"
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/asr_navfn
)
_generate_srv_py(asr_navfn
  "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/asr_navfn
)

### Generating Module File
_generate_module_py(asr_navfn
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/asr_navfn
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(asr_navfn_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(asr_navfn_generate_messages asr_navfn_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/MakeNavPlan.srv" NAME_WE)
add_dependencies(asr_navfn_generate_messages_py _asr_navfn_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/amir/Desktop/BC-SCAND/scandparser/src/asr_navfn/srv/SetCostmap.srv" NAME_WE)
add_dependencies(asr_navfn_generate_messages_py _asr_navfn_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(asr_navfn_genpy)
add_dependencies(asr_navfn_genpy asr_navfn_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS asr_navfn_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/asr_navfn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/asr_navfn
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(asr_navfn_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()
if(TARGET geometry_msgs_generate_messages_cpp)
  add_dependencies(asr_navfn_generate_messages_cpp geometry_msgs_generate_messages_cpp)
endif()
if(TARGET nav_msgs_generate_messages_cpp)
  add_dependencies(asr_navfn_generate_messages_cpp nav_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/asr_navfn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/asr_navfn
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(asr_navfn_generate_messages_eus std_msgs_generate_messages_eus)
endif()
if(TARGET geometry_msgs_generate_messages_eus)
  add_dependencies(asr_navfn_generate_messages_eus geometry_msgs_generate_messages_eus)
endif()
if(TARGET nav_msgs_generate_messages_eus)
  add_dependencies(asr_navfn_generate_messages_eus nav_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/asr_navfn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/asr_navfn
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(asr_navfn_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()
if(TARGET geometry_msgs_generate_messages_lisp)
  add_dependencies(asr_navfn_generate_messages_lisp geometry_msgs_generate_messages_lisp)
endif()
if(TARGET nav_msgs_generate_messages_lisp)
  add_dependencies(asr_navfn_generate_messages_lisp nav_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/asr_navfn)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/asr_navfn
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(asr_navfn_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()
if(TARGET geometry_msgs_generate_messages_nodejs)
  add_dependencies(asr_navfn_generate_messages_nodejs geometry_msgs_generate_messages_nodejs)
endif()
if(TARGET nav_msgs_generate_messages_nodejs)
  add_dependencies(asr_navfn_generate_messages_nodejs nav_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/asr_navfn)
  install(CODE "execute_process(COMMAND \"/home/amir/anaconda3/envs/scand/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/asr_navfn\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/asr_navfn
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(asr_navfn_generate_messages_py std_msgs_generate_messages_py)
endif()
if(TARGET geometry_msgs_generate_messages_py)
  add_dependencies(asr_navfn_generate_messages_py geometry_msgs_generate_messages_py)
endif()
if(TARGET nav_msgs_generate_messages_py)
  add_dependencies(asr_navfn_generate_messages_py nav_msgs_generate_messages_py)
endif()
