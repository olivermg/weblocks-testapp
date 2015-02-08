
(in-package :wl-owtest01)

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
    (:p (cl-who:esc (format nil "The counter is at ~D." (count-of widget))))
    (:p (render-link
	 (lambda (&rest args)
	   (declare (ignore args))
	   (incf (count-of widget))
	   (mark-dirty widget))
	 "Count up!"))))

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
	 (make-instance 'counter)
	 (make-instance 'datalist
			:data-class 'recipe))))

