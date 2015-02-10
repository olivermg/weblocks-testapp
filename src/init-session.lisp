
(in-package :wl-owtest01)

#|
(defmethod render-page-headers ((app wl-owtest01))
  (call-next-method app))
|#

#|
(defmethod render-dependency-in-page-head (obj)
  (with-html
    (:script "jQuery.noConflict();")))
|#

#|
(defmethod dependencies append (obj)
  (list
   (with-html
     (:script "jQuery.noConflict();"))))
|#

(defclass recipe ()
  ((id :accessor recipe-id)
   (name :accessor recipe-name
	 :initarg :name)
   (description :accessor recipe-description
		:initarg :description)))

(defwidget counter ()
  ((count :accessor count-of :initform 0)))

(defmethod render-widget-body ((widget counter) &rest args)
  (declare (ignore args))
  (with-html
    (:div :class "row"
	  (:div :class "col-sm-12"
		(:div (cl-who:esc (format nil "The counter is at ~D." (count-of widget))))
		(:div (render-link
		       (lambda (&rest args)
			 (declare (ignore args))
			 (incf (count-of widget))
			 (mark-dirty widget))
		       "Count up!"))))))

#|
(defmethod render-page-headers (app)
  (with-html
    (:link :rel "stylesheet" :type "text/css" :href "/pub/stylesheets/bootstrap.css")))
|#

#|
(defun ow-page-body-wt (&key body-string &allow-other-keys)
  (with-html-to-string
    (:div :class "container"
	  ;(render-extra-tags "page-extra-top-" 3)
	  (cl-who:htm (cl-who:str body-string))
	  ;(render-extra-tags "page-extra-bottom-" 3)
	  )))

(weblocks-util:deftemplate :page-body-wt 'ow-page-body-wt
  :context-matches (lambda (&rest context)
		     (declare (ignore context))
		     10))
|#

;; Define callback function to initialize new sessions
(defun init-user-session (root)
  #|
  (persist-object *wl-owtest01-store*
		  (make-instance 'recipe
				 :name "wurst"
				 :description "just a wurst"))
  (persist-object *wl-owtest01-store*
		  (make-instance 'recipe
				 :name "schinken"
				 :description "just a schinken"))
  |#
  (setf (widget-children root)
        (list
	 #|
	 (lambda (&rest args)
	   (with-html
	     (:strong "Happy Hacking!")))
	 |#
	 (lambda () (with-html
		      (render-message
		       (if (authenticatedp)
			   "LOGGED IN!"
			   "LOGGED OUT!")
		       *authentication-key*)))

	 (make-instance 'counter)

	 (lambda () (with-html
		      (if (authenticatedp)
			  (render-link
			   (lambda (&rest args)
			     (declare (ignore args))
			     (logout)
			     (mark-dirty root))
			   "Logout")
			  (render-link
			   (lambda (&rest args)
			     (declare (ignore args))
			     (do-login (lambda (obj &rest args)
					 (declare (ignore obj args))
					 13241325)))
			   "Login"))))

	 (make-instance 'datalist
			:data-class 'recipe))))

