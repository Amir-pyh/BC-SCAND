// Generated by gencpp from file asr_navfn/SetCostmap.msg
// DO NOT EDIT!


#ifndef ASR_NAVFN_MESSAGE_SETCOSTMAP_H
#define ASR_NAVFN_MESSAGE_SETCOSTMAP_H

#include <ros/service_traits.h>


#include <asr_navfn/SetCostmapRequest.h>
#include <asr_navfn/SetCostmapResponse.h>


namespace asr_navfn
{

struct SetCostmap
{

typedef SetCostmapRequest Request;
typedef SetCostmapResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct SetCostmap
} // namespace asr_navfn


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::asr_navfn::SetCostmap > {
  static const char* value()
  {
    return "370ec969cdb71f9cde7c7cbe0d752308";
  }

  static const char* value(const ::asr_navfn::SetCostmap&) { return value(); }
};

template<>
struct DataType< ::asr_navfn::SetCostmap > {
  static const char* value()
  {
    return "asr_navfn/SetCostmap";
  }

  static const char* value(const ::asr_navfn::SetCostmap&) { return value(); }
};


// service_traits::MD5Sum< ::asr_navfn::SetCostmapRequest> should match
// service_traits::MD5Sum< ::asr_navfn::SetCostmap >
template<>
struct MD5Sum< ::asr_navfn::SetCostmapRequest>
{
  static const char* value()
  {
    return MD5Sum< ::asr_navfn::SetCostmap >::value();
  }
  static const char* value(const ::asr_navfn::SetCostmapRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::asr_navfn::SetCostmapRequest> should match
// service_traits::DataType< ::asr_navfn::SetCostmap >
template<>
struct DataType< ::asr_navfn::SetCostmapRequest>
{
  static const char* value()
  {
    return DataType< ::asr_navfn::SetCostmap >::value();
  }
  static const char* value(const ::asr_navfn::SetCostmapRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::asr_navfn::SetCostmapResponse> should match
// service_traits::MD5Sum< ::asr_navfn::SetCostmap >
template<>
struct MD5Sum< ::asr_navfn::SetCostmapResponse>
{
  static const char* value()
  {
    return MD5Sum< ::asr_navfn::SetCostmap >::value();
  }
  static const char* value(const ::asr_navfn::SetCostmapResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::asr_navfn::SetCostmapResponse> should match
// service_traits::DataType< ::asr_navfn::SetCostmap >
template<>
struct DataType< ::asr_navfn::SetCostmapResponse>
{
  static const char* value()
  {
    return DataType< ::asr_navfn::SetCostmap >::value();
  }
  static const char* value(const ::asr_navfn::SetCostmapResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // ASR_NAVFN_MESSAGE_SETCOSTMAP_H
