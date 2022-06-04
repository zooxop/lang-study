#pragma once

// 템플릿 함수 정의
template <typename T>
T smallest(const T& first, const T& second)
{
  if(first < second)
  {
    return first;
  }
  return second;
}
// 템플릿 함수 정의
template <typename T>
T smallest(const T& first, const T& second, const T& third)
{
  return smallest(smallest(first, second), third);
}