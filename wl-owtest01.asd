;;;; -*- Mode: Lisp; Syntax: ANSI-Common-Lisp; Base: 10 -*-
(defpackage #:wl-owtest01-asd
  (:use :cl :asdf))

(in-package :wl-owtest01-asd)

(defsystem wl-owtest01
    :name "wl-owtest01"
    :version "0.0.1"
    :maintainer ""
    :author ""
    :licence ""
    :description "wl-owtest01"
    :depends-on (:weblocks)
    :components ((:file "wl-owtest01")
                 (:module conf
                  :components ((:file "stores"))
                  :depends-on ("wl-owtest01"))
                 (:module src
                  :components ((:file "init-session"))
                  :depends-on ("wl-owtest01" conf))))

