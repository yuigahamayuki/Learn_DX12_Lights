#pragma once

#include "common_headers.h"

using namespace DirectX;

class SpotLight {
public:
  SpotLight();
  ~SpotLight() = default;

  SpotLight(const SpotLight&) = default;
  SpotLight& operator=(const SpotLight&) = default;

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