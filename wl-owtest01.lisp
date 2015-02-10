
(defpackage #:wl-owtest01
  (:use :cl :weblocks
        :f-underscore :anaphora)
  (:import-from :hunchentoot #:header-in
                #:set-cookie #:set-cookie* #:cookie-in
                #:user-agent #:referer)
  (:documentation
   "A web application based on Weblocks."))

(in-package :wl-owtest01)

(export '(start-wl-owtest01 stop-wl-owtest01))

;; A macro that generates a class or this webapp

(defwebapp wl-owtest01
    :prefix "/"
    :description "wl-owtest01: A new application"
    :init-user-session 'wl-owtest01::init-user-session
    :autostart nil                   ;; have to start the app manually
    :ignore-default-dependencies nil ;; accept the defaults
    :dependencies '((:stylesheet "bootstrap")
		    (:script "jquery.min")
		    (:js "jQuery.noConflict();"))
    :debug t
    )

;; Top level start & stop scripts

(defun start-wl-owtest01 (&rest args)
  "Starts the application by calling 'start-weblocks' with appropriate
arguments."
  (apply #'start-weblocks args)
  (start-webapp 'wl-owtest01))

(defun stop-wl-owtest01 ()
  "Stops the application by calling 'stop-weblocks'."
  (stop-webapp 'wl-owtest01)
  (stop-weblocks))

