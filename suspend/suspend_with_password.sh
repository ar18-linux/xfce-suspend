#!/bin/bash


function run() {
  kill "$(pidof xfce4-power-manager-settings)" &
  wait $!
  xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/lock-screen-suspend-hibernate -s true &
  wait $!
  xfce4-power-manager -c &
  wait $!
  sleep 0.5
  kill "$(pidof xfce4-power-manager-settings)" &
  wait $!
  systemctl suspend
}


run