// Generated by gencpp from file asr_navfn/SetCostmapResponse.msg
// DO NOT EDIT!


#ifndef ASR_NAVFN_MESSAGE_SETCOSTMAPRESPONSE_H
#define ASR_NAVFN_MESSAGE_SETCOSTMAPRESPONSE_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace asr_navfn
{
template <class ContainerAllocator>
struct SetCostmapResponse_
{
  typedef SetCostmapResponse_<ContainerAllocator> Type;

  SetCostmapResponse_()
    {
    }
  SetCostmapResponse_(const ContainerAllocator& _alloc)
    {
  (void)_alloc;
    }







  typedef boost::shared_ptr< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> const> ConstPtr;

}; // struct SetCostmapResponse_

typedef ::asr_navfn::SetCostmapResponse_<std::allocator<void> > SetCostmapResponse;

typedef boost::shared_ptr< ::asr_navfn::SetCostmapResponse > SetCostmapResponsePtr;
typedef boost::shared_ptr< ::asr_navfn::SetCostmapResponse const> SetCostmapResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::asr_navfn::SetCostmapResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}


} // namespace asr_navfn

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "d41d8cd98f00b204e9800998ecf8427e";
  }

  static const char* value(const ::asr_navfn::SetCostmapResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xd41d8cd98f00b204ULL;
  static const uint64_t static_value2 = 0xe9800998ecf8427eULL;
};

template<class ContainerAllocator>
struct DataType< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "asr_navfn/SetCostmapResponse";
  }

  static const char* value(const ::asr_navfn::SetCostmapResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "\n"
;
  }

  static const char* value(const ::asr_navfn::SetCostmapResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream&, T)
    {}

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetCostmapResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::asr_navfn::SetCostmapResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream&, const std::string&, const ::asr_navfn::SetCostmapResponse_<ContainerAllocator>&)
  {}
};

} // namespace message_operations
} // namespace ros

#endif // ASR_NAVFN_MESSAGE_SETCOSTMAPRESPONSE_H