# 2D Platformer Prototype

A Godot 4.6 prototype for a 2D platformer built around reusable entity/component architecture.

## Overview

This repository contains a small platformer prototype with:
- `scenes/world.tscn` as the main scene
- a player entity under `scenes/Entities/player.tscn`
- component-based entity logic in `Scripts/Entity`
- reusable platform and attack scenes
- tile-based level assets and one-way platforms

## Getting Started

### Requirements
- Godot Engine 4.6 (or compatible 4.x version)

### Open the project
1. Launch Godot.
2. Open the project folder: `2dPlatformer-prototype`.
3. Run the main scene or press `F5`.

## Controls

The input actions are defined in `project.godot`:
- `move_right` - D or Right Arrow
- `move_left` - A or Left Arrow
- `jump` - P or Space
- `attack` - O or 7

## Project Structure

- `project.godot` - Godot project settings and input map
- `scenes/world.tscn` - main level scene
- `scenes/Entities/player.tscn` - player entity scene
- `Scripts/Entity` - base entity scripts and component loading
- `Scripts/others` - world logic and utilities like `kill_zone.gd`
- `Resources/PlayerStats.tres` - player stats resource
- `assets/` - art assets and tilesets

## ECS-style Component System

This project uses a lightweight ECS-style system built with Godot nodes:
- `Entity` objects load child `Component` nodes from a `properties` folder.
- Each `Component` has an `init(entity)` and `process(delta)` lifecycle method.
- The entity iterates over active components in `_physics_process`, so behavior is split into reusable pieces like movement, gravity, and attacks.
- Components can be enabled or disabled at runtime, making the entity behavior modular and easier to extend.

## Notes

- The game uses `res://scenes/world.tscn` as the startup scene.
- The player scene includes movement and gravity components.
- This repository is intended as a prototype and starting point for further 2D platformer development.
