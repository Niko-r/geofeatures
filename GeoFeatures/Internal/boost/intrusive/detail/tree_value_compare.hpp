//////////////////////////////////////////////////////////////////////////////
//
// (C) Copyright Ion Gaztanaga 2015-2015. Distributed under the Boost
// Software License, Version 1.0. (See accompanying file
// LICENSE_1_0.txt or copy at http://www.boost.org/LICENSE_1_0.txt)
//
// See http://www.boost.org/libs/container for documentation.
//
//////////////////////////////////////////////////////////////////////////////
#ifndef BOOST_INTRUSIVE_DETAIL_TREE_VALUE_COMPARE_HPP
#define BOOST_INTRUSIVE_DETAIL_TREE_VALUE_COMPARE_HPP

#ifndef BOOST_CONFIG_HPP
#  include <boost/config.hpp>
#endif

#if defined(BOOST_HAS_PRAGMA_ONCE)
#  pragma once
#endif

#include <boost/intrusive/detail/mpl.hpp>
#include <boost/intrusive/detail/ebo_functor_holder.hpp>

namespace geofeatures_boost {} namespace boost = geofeatures_boost; namespace geofeatures_boost{
namespace intrusive{

template<class Key, class T, class KeyCompare, class KeyOfValue>
struct tree_value_compare
   :  public geofeatures_boost::intrusive::detail::ebo_functor_holder<KeyCompare>
{
   typedef geofeatures_boost::intrusive::detail::ebo_functor_holder<KeyCompare> base_t;
   typedef T            value_type;
   typedef KeyCompare   key_compare;
   typedef KeyOfValue   key_of_value;
   typedef Key          key_type;

   explicit tree_value_compare(const key_compare &kcomp)
      :  base_t(kcomp)
   {}

   tree_value_compare()
      :  base_t()
   {}

   const key_compare &key_comp() const
   {  return static_cast<const key_compare &>(*this);  }

   key_compare &key_comp()
   {  return static_cast<key_compare &>(*this);  }

   template<class U>
   struct is_key
      : geofeatures_boost::intrusive::detail::is_same<const U, const key_type>
   {};

   template<class U>
   typename geofeatures_boost::intrusive::detail::enable_if<is_key<U>, const key_type &>::type
      key_forward(const U &key) const
   {  return key; }

   template<class U>
   typename geofeatures_boost::intrusive::detail::disable_if<is_key<U>, const key_type &>::type
      key_forward(const U &key) const
   {  return KeyOfValue()(key);  }

   template<class KeyType, class KeyType2>
   bool operator()(const KeyType &key1, const KeyType2 &key2) const
   {  return key_compare::operator()(this->key_forward(key1), this->key_forward(key2));  }

   template<class KeyType, class KeyType2>
   bool operator()(const KeyType &key1, const KeyType2 &key2)
   {  return key_compare::operator()(this->key_forward(key1), this->key_forward(key2));  }
};

}  //namespace intrusive{
}  //namespace geofeatures_boost {} namespace boost = geofeatures_boost; namespace geofeatures_boost{

#endif   //#ifdef BOOST_INTRUSIVE_DETAIL_TREE_VALUE_COMPARE_HPP
