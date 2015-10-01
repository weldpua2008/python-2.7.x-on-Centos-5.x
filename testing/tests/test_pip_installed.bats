#!/usr/bin/env bats
@test "invoking pip2.7 and expecting exit code 0" {
  run pip2.7 --version
  [ "$status" -eq 0 ]
}