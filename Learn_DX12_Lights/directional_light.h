#pragma once

#include "common_headers.h"

using namespace DirectX;

class DirectionalLight {
public:
  DirectionalLight();
  ~DirectionalLight() = default;

  DirectionalLight(const DirectionalLight&) = default;
  DirectionalLight& operator=(const DirectionalLight&) = default;

  XMFLOAT3 world_direction() const {
    return world_direction_;
  }

  XMFLOAT3 light_color() const {
    return light_color_;
  }

private:
  XMFLOAT3 world_direction_;
  XMFLOAT3 light_color_;
};  // class DirectionalLight