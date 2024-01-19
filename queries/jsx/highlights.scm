;; extends
;; (("return" @keyword) (#set! conceal "~"))
;; ((jsx_attribute (property_identifier) (string) @class-name) (#set! conceal "~"))
;; ((jsx_attribute (property_identifier) @class-name) (#set! conceal "~"))
;; ((jsx_attribute (property_identifier) @class-name (string) @class-name-value (#eq? @class-name "className")) (#set! conceal "~"))
;; (
;;  (jsx_attribute 
;;    (property_identifier) @class-name (#eq? @class-name "className")
;;    ((string) @class-name-value
;;       (string_fragment) @class-name-fragment (#set! @class-name-fragment conceal "~")
;;    )
;; ))
 
(
 (jsx_attribute
   (string) @value
) (#set! conceal "…"))

 
