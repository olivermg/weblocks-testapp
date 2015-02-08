
(in-package :wl-owtest01)

;;; Multiple stores may be defined. The last defined store will be the
;;; default.
(defstore *wl-owtest01-store* :prevalence
  (merge-pathnames (make-pathname :directory '(:relative "data"))
                   (asdf-system-directory :wl-owtest01)))

