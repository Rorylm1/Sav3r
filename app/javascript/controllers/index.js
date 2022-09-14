// This file is auto-generated by ./bin/rails stimulus:manifest:update
// Run that command whenever you add a new controller or create them with
// ./bin/rails generate stimulus controllerName

import { application } from "./application"

import AddItemController from "./add_item_controller"
application.register("add-item", AddItemController)

import CartController from "./cart_controller"
application.register("cart", CartController)

import HelloController from "./hello_controller"
application.register("hello", HelloController)

import SidebarController from "./sidebar_controller"
application.register("sidebar", SidebarController)
