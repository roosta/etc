#!/bin/bash
error_msg() {
  echo "missing argument(s)"
  exit 1
}
(( $# == 1 )) || error_msg

