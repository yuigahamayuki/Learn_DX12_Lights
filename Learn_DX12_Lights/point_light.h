#pragma once

#include "common_headers.h"

using namespace DirectX;

class PointLight {
public:
  PointLight();
  ~PointLight() = default;

  PointLight(const PointLight&) = default;
  PointLight& operator=(const PointLight&) = default;

  XMFLOAT3 world_pos() const {
    return world_pos_;
  }

  XMFLOAT3 light_color() const {
    return light_color_;
  }

private:
  XMFLOAT3 world_pos_;
  XMFLOAT3 light_color_;
};