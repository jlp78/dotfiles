;;; font-lock-color-test.el --- Tool to test new font lock colors.
;;
;; Author: Lennart Borgman (lennart O borgman A gmail O com)
;; Created: 2009-07-31 Fri
;; Last-Updated: 2009-07-31 Fri
;; URL: http://www.emacswiki.org/emacs/font-lock-color-test.el
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;;; Commentary:
;;
;; This is for testing new font-lock-* faces colors, see function
;; `test-font-lock-colors'
;;
;; To see current suggestions do `M-x test-font-lock-colors'.
;;
;; You are welcome to add your own suggestions in the variable
;; `test-font-lock-suggestions' below.
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defconst less-important-font-lock-color-differences
  '((font-lock-doc-face font-lock-string-face)
    (font-lock-comment-face font-lock-comment-delimiter-face)
    ))

(defconst min-lumosity-diff-between-faces 130)

(defconst test-font-lock-suggestions
  '((light ;; light background
     ("chong1" (
                (font-lock-builtin-face "MediumOrchid4")
                (font-lock-constant-face "dark cyan") ;; 4.1
                (font-lock-string-face  "VioletRed4")
                (font-lock-variable-name-face "OrangeRed4")
                ))
     ("lennart1" (
                  (font-lock-builtin-face "Orchid4")
                  (font-lock-builtin-face "Orchid3") ;; 3.3

                  (font-lock-preprocessor-face "DeepPink3") ;; Make it stand out
                  (font-lock-warning-face "red2")
                  (font-lock-constant-face "turquoise4")

                  (font-lock-doc-face  "#797900") ;;
                  (font-lock-doc-face  "yellow4") ;; 3.6 clashes var...
                  (font-lock-doc-face  "#9C6969") ;; 4.5, darker RosyBrown, clashes builtin, var ...
                  (font-lock-doc-face  "#357800") ;; 
                  (font-lock-doc-face  "chartreuse4") ;; 4.2 clashes type, var ...
                  (font-lock-doc-face  "green4") ;; clashes type...
                  (font-lock-doc-face  "DarkOliveGreen4") ;; 3.9 clashes type, var...
                  (font-lock-doc-face  "OliveDrab3") ;; 1.9
                  (font-lock-doc-face  "OliveDrab4") ;; 3.9 clashes var, type ...
                  (font-lock-doc-face  "RosyBrown4") ;; clashes builtin, var ..
                  (font-lock-doc-face  "VioletRed4") ;; clashes comment, builtin, pre ...
                  (font-lock-doc-face  "maroon") ;; clashes comment, pre, builtin ...
                  (font-lock-doc-face  "MistyRose4") ;; 3.9, clashes builtin, var...
                  (font-lock-doc-face  "PeachPuff4") ;; clashes builtin, var ...
                  (font-lock-doc-face  "SaddleBrown") ;; clashes var, comment, builtin ...
                  (font-lock-doc-face  "burlywood4") ;; clashes builtin, var...
                  (font-lock-doc-face  "#8B7D7B") ;; MistyRose4
                  (font-lock-doc-face  "#BC8F8F") ;; RosyBrown
                  (font-lock-doc-face  "#8B726a")
                  (font-lock-doc-face  "#8B6D7B")
                  (font-lock-doc-face  "orange4") ;; Too similar to var face
                  (font-lock-doc-face  "Salmon4") ;; 3.5
                  (font-lock-doc-face  "VioletRed3") ;; Too outstanding
                  (font-lock-doc-face  "chocolate3") ;; 3.8
                  (font-lock-doc-face  "orange3") ;; 3.0
                  (font-lock-doc-face  "Salmon3") ;; 3.5
                  (font-lock-doc-face  "RosyBrown3") ;; 2.4

                  (font-lock-string-face  "#797900") ;;
                  (font-lock-variable-name-face "#9b6900")
                  (font-lock-variable-name-face "goldenrod4")
                  (font-lock-variable-name-face "tan4")
                  ))
     )
     (dark ;; dark background
      ))
  "Suggestions for fon-lock-* faces colors.
You are welcome to enter your own suggestions here!

The suggestions are divided in those for light and dark
backgrounds.

Each suggestion should have a name, like \"chong1\" in the code
for this variable.

If a font-lock-* face name is specified several times for a
suggestion the first color record is used.  This allows you to
test colors more easily.  You can add notes about problems etc,
for an example see \"lennart1\" in the code for this variable.
")


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Don't edit below this line (unless you have a good reason...)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun unimportant-font-lock-diff (f1 f2)
  (let ((a1 (assoc f1 less-important-font-lock-color-differences))
        (a2 (assoc f2 less-important-font-lock-color-differences))
        )
    (or (and a1 (memq f2 a1))
        (and a2 (memq f1 a2)))))

;;(get-test-font-lock-suggestions)
(defun get-test-font-lock-suggestions ()
  "Get color suggestions for current background mode."
  (cdr (assoc (frame-parameter nil 'background-mode)
               test-font-lock-suggestions)))

(defvar test-font-lock-colors-hist nil)
(defun test-font-lock-colors (suggestions)
  "Show suggestions SUGGESTIONS for new font lock colors.
Chong suggested changing the font-lock-* faces.  This is a tool
to help with that.  For more information see URL
`http://lists.gnu.org/archive/html/emacs-devel/2009-07/msg01577.html'.

You are welcome to add your own suggestions to
`test-font-lock-suggestions' in this file on EmacsWiki."
  (interactive (let (choices
                     (choice "dummy"))
                 (while (not (string= choice ""))
                   (setq choice (completing-read (if choices "Show suggestion: "
                                                   "Show suggestion (just RET for all): ")
                                                 (get-test-font-lock-suggestions)
                                                 nil ;; pred
                                                 t   ;; require match
                                                 nil ;; initial
                                                 'test-font-lock-colors-hist
                                                 ))
                   (unless (string= choice "")
                     (add-to-list 'choices choice t)))
                 (unless choices
                   (setq choices (mapcar (lambda (rec)
                                           (car rec))
                                         (get-test-font-lock-suggestions))))
                 (list choices)))
  (catch 'stop
    (dolist (sug suggestions)
      (let ((face-colors (cadr (assoc sug (get-test-font-lock-suggestions)))))
        (dolist (face-color face-colors)
          (unless (color-values (cadr face-color))
            (message "Bad color value in %s: %s" sug face-color)
            (throw 'stop nil)))))
    (let ((flf
           '(;; Order these so that faces that are hard to distinguish
             ;; are shown close to each other.
             font-lock-builtin-face
             font-lock-keyword-face
             font-lock-preprocessor-face

             ;;font-lock-comment-delimiter-face ;; Does not everyone expect it to be comment-face?
             font-lock-comment-face
             font-lock-warning-face

             font-lock-constant-face
             font-lock-type-face

             font-lock-doc-face
             font-lock-string-face
             font-lock-variable-name-face

             font-lock-function-name-face

             ;; font-lock-negation-char-face
             ;; font-lock-regexp-grouping-backslash
             ;; font-lock-regexp-grouping-construct
             ))
          (buf (generate-new-buffer "Font lock face test"))
          (try-these (mapcar (lambda (suggestion)
                               (assoc suggestion (get-test-font-lock-suggestions)))
                               ;;(cadr (assoc "chong1" (get-test-font-lock-suggestions)))
                             suggestions))
          (background-color (frame-parameter nil 'background-color))
          )
      (with-current-buffer buf
        (setq show-trailing-whitespace nil)
        (insert "
Faces luminosity contrast ratio towards current background
color. A luminosity contrast ratio higher than 4.5:1 is ok
according to WACG.  These values seems useful, see for example
http://www.snook.ca/technical/colour_contrast/colour.html or
http://juicystudio.com/article/luminositycontrastratioalgorithm.php
")
        (insert (make-string 35 ?\ )
                (format "%-20s" "Current"))
        (dolist (suggestion suggestions)
          (insert (display-color-bg-difference background-color nil))
          (insert (format "%-20s" suggestion)))
        (insert "\n\n")
        (setq current-font-lock-luminosity-contrast-ratios nil)
        (dolist (f flf)
          (setq current-font-lock-luminosity-contrast-ratios
                (cons
                 (cons f
                       (display-color-luminosity-contrast-ratio background-color (face-foreground f)))
                 current-font-lock-luminosity-contrast-ratios
                 )))
        (dolist (f flf)
          (insert
           (format "%-33s" f)
           ;;(propertize "abcdef" 'face f)
           (display-color-luminosity-contrast-ratio background-color (face-foreground f))
           (display-color-bg-difference background-color (face-foreground f))
           (format " %-14s" (propertize (face-foreground f) 'face f))
           )
          (dolist (try-this try-these)
            (let* ((try-face (assoc f (cadr try-this)))
                   (new-face (cadr try-face)))
              (insert
               (if new-face
                   (display-color-luminosity-contrast-ratio background-color new-face)
                 (display-current-font-lock-luminosity-contrast f))
               (display-color-bg-difference background-color new-face)
               (if new-face
                   ;;(propertize " abcdef" 'face `(:foreground ,new-face))
                   (format " %-14s" (propertize new-face 'face `(:foreground ,new-face)))
                 (make-string 15 ?\ ))
               )))
          (insert "\n"))
        ;; Color differences
        (insert "

The color differences below should not be taken too seriously.  I
have tried to implement a better algorithm for it, but have
failed so far to find fully understandable information.  \(If
anyone wonder and have information I was looking for CEILuv or
something similar.)
")
        (let ((schemes (cons nil try-these)))
          (dolist (scheme schemes)
            (let ((min-diff min-lumosity-diff-between-faces)
                  tail f1 f2 cdiff
                  (scheme-faces (cadr scheme))
                  ffg1 ffg2
                  diff-list)
              (dolist (f1 flf)
                (dolist (f2 (cdr (memq f1 flf)))
                  (unless (unimportant-font-lock-diff f1 f2)
                    (setq ffg1 (or (cadr (assoc f1 scheme-faces))
                                   (face-foreground f1)))
                    (setq ffg2 (or (cadr (assoc f2 scheme-faces))
                                   (face-foreground f2)))
                    (setq cdiff (color-difference ffg1 ffg2))
                    (when (< cdiff min-diff)
                      (setq diff-list
                            (cons
                             (cons cdiff
                                   (format
                                    ;;" diff=%s < %s: %s <-> %s (%s <-> %s)\n"
                                    " diff=%s < %s: %s <-> %s\n"
                                    cdiff min-diff
                                    (propertize (symbol-name f1) 'face `(:foreground ,ffg1))
                                    (propertize (symbol-name f2) 'face `(:foreground ,ffg2))
                                    ;;(color-to-sh6 ffg1)
                                    ;;(color-to-sh6 ffg2)
                                    ))
                             diff-list))))))
              (when diff-list
                (insert (format "\nColor differences that are small for %s faces:\n"
                                (if (not scheme) "current" (car scheme))))
                (dolist (diff (sort diff-list (lambda (a b) (< (car a) (car b)))))
                  (insert (cdr diff)))))))

        (goto-char (point-min)))
      (display-buffer buf)
      )))

(defvar current-font-lock-luminosity-contrast-ratios nil)
(defun display-current-font-lock-luminosity-contrast (face-name)
  (cdr (assoc face-name current-font-lock-luminosity-contrast-ratios)))
;;(face-foreground 'font-lock-function-name-face)
;;(face-foreground 'font-lock-preprocessor-face)
;;(face-foreground 'font-lock-doc-face)

(defun face-foreground (face)
  "Get foreground color of face FACE."
  (interactive (list (read-face-name "Face")))
  (let ((color (face-attribute face :foreground))
        (inherit (face-attribute face :inherit)))
    (while (and (eq color 'unspecified)
                (not (eq inherit 'unspecified)))
      (setq face inherit)
      (setq color (face-attribute face :foreground))
      (setq inherit (face-attribute face :inherit)))
    (when (called-interactively-p)
      (message "Foreground color of face %s: %s (%s, %s)" face color (color-to-sh6 color)
               (propertize "example" 'face face)))
    ;; Fix-me:
    (if (eq color 'unspecified) "black" color)))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Luminosity contrast

(defun relative-luminance (color-str)
  "Relative luminance of color COLOR-STR.
The relative brightness of any point in a colorspace, normalized
to 0 for darkest black and 1 for lightest white.

Note 1: For the sRGB colorspace, the relative luminance of a
color is defined as L = 0.2126 * R + 0.7152 * G + 0.0722 * B
where R, G and B are defined as:

  if RsRGB <= 0.03928 then R = RsRGB/12.92 else R = ((RsRGB+0.055)/1.055) ^ 2.4
  if GsRGB <= 0.03928 then G = GsRGB/12.92 else G = ((GsRGB+0.055)/1.055) ^ 2.4
  if BsRGB <= 0.03928 then B = BsRGB/12.92 else B = ((BsRGB+0.055)/1.055) ^ 2.4

and RsRGB, GsRGB, and BsRGB are defined as:

  RsRGB = R8bit/255
  GsRGB = G8bit/255
  BsRGB = B8bit/255

See URL `http://www.w3.org/TR/2008/REC-WCAG20-20081211/#relativeluminancedef'."
  (let* ((rgb (mapcar (lambda (val)
                        (let ((rel-val (/ val (* 256.0 256.0))))
                          (if (<= rel-val 0.03928)
                              (/ rel-val 12.92)
                            (expt (/ (+ rel-val 0.055)
                                     1.055)
                                  2.4))))
                      (color-values color-str)))
         (r (nth 0 rgb))
         (g (nth 1 rgb))
         (b (nth 2 rgb)))
    (+ (* 0.2126 r)
       (* 0.7152 g)
       (* 0.0722 b))))

(defun luminance-contrast-ratio (l1 l2)
  "Contrast ratio between relative luminances L1 and L2.
Defined as

  (L1 + 0.05) / (L2 + 0.05)

where

  L1 is the relative luminance of the lighter of the colors, and
  L2 is the relative luminance of the darker of the colors.

See URL `http://www.w3.org/TR/2008/REC-WCAG20-20081211/#contrast-ratiodef'."
  (let* ((l-dark (if (> l1 l2) l2 l1))
         (l-bright (if (> l1 l2) l1 l2))
         (ratio (/ (+ l-bright 0.05)
                   (+ l-dark   0.05))))
    ;; Fix-me: There is something wrong in the formulas, ratio max is
    ;; 21, but I get 21.4 ...? Turned out to be an error in w3
    ;; description of algorithm. You should of course divide by 256,
    ;; not 255.
    ratio))

(defun color-luminosity-contrast-ratio (color1 color2)
  "Compute color contrast between colors COLOR1 and COLOR2."
  (let ((lum1 (relative-luminance color1))
        (lum2 (relative-luminance color2)))
    (luminance-contrast-ratio lum1 lum2)))

(defun display-color-luminosity-contrast-ratio (color1 color2)
  "Return string with contrast between colors COLOR1 and COLOR2."
  (if (not (and color1 color2))
      (if color1
          "testi"
      "     ")
    (let* ((ratio (color-luminosity-contrast-ratio color1 color2))
           (str (format "%5.1f" ratio)))
      (cond
       ((< ratio 3.8)
        (propertize str 'face 'font-lock-warning-face))
       ((< ratio 4.25)
        (propertize str 'face '(:foreground "red3")))
       ((< ratio 4.45) ;; rounding on display
        (propertize str 'face '(:foreground "red4")))
       (t
        str)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Color difference

;;(color-difference "#ffffff" "#000000")
(defun color-difference (color1 color2)
  (let ((rgb1 (color-values color1))
        (rgb2 (color-values color2))
        (diff 0)
        )
    (dolist (n '(0 1 2))
      (setq diff (+ diff (/ (abs (- (nth n rgb1)
                                    (nth n rgb2)))
                            256))))
    diff))

(defun display-color-bg-difference (color1 color2)
  ;; Using this seems to spoil much of the possibilities to use
  ;; different colors.  If I understand Gez correctly (see
  ;; http://juicystudio.com/services/aertcolourcontrast.php) this
  ;; algorithm is depreceated in favor of the luminosity based
  ;; algorithms.
  (if t
      "" ;; Don't display color difference
    (if (not (and color1 color2))
        "    "
      (let* ((diff (color-difference color1 color2))
             (str (format " %3d" diff)))
        (cond
         ((< diff 400)
          (propertize str 'face 'font-lock-warning-face))
         ((< diff 450)
          (propertize str 'face '(:foreground "red3")))
         ((< diff 500)
          (propertize str 'face '(:foreground "red4")))
         (t str))))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; CIE Luv

;; Fix-me: THIS PART CAN NOT BE USED. The algorithms does not seem to
;; be correct. For example will rgb=(0 0 0) give xyz = (0 0 0), but
;; that will crash (color-cieluv-values color).

;; Color differences like above does not seem to be very useful (even
;; though w3c writes about them...). Instead it looks like CIE Luv and
;; similar must be used.

;;; http://cs.haifa.ac.il/hagit/courses/ist/Lectures/Demos/ColorApplet2/t_convert.html
;;
;; To transform from XYZ to RGB (with D65 white point), the matrix
;; transform used is [3]:
;;
;;    [ R ]   [  3.240479 -1.537150 -0.498535 ]   [ X ]
;;    [ G ] = [ -0.969256  1.875992  0.041556 ] * [ Y ]
;;    [ B ]   [  0.055648 -0.204043  1.057311 ]   [ Z ].
;;
;; The range for valid R, G, B values is [0,1]. Note, this matrix has
;; negative coefficients. Some XYZ color may be transformed to RGB
;; values that are negative or greater than one. This means that not
;; all visible colors can be produced using the RGB system.
;;
;; The inverse transformation matrix is as follows:
;;
;;    [ X ]   [  0.412453  0.357580  0.180423 ]   [ R ] **
;;    [ Y ] = [  0.212671  0.715160  0.072169 ] * [ G ]
;;    [ Z ]   [  0.019334  0.119193  0.950227 ]   [ B ].

(defun color-xyz-values (color)
  (let* ((rgb (mapcar (lambda (v)
                        (/ v (* 256 256.0)))
                      (color-values color)))
         (r (nth 0 rgb))
         (g (nth 1 rgb))
         (b (nth 2 rgb))
         (x (+ (* r 0.412453) (* g 0.357580) (* b 0.180423)))
         (y (+ (* r 0.212671) (* g 0.715160) (* b 0.072169)))
         (z (+ (* r 0.019334) (* g 0.119193) (* b 0.950227))))
    (list x y z)))

;; CIE 1976 L*u*u* (CIELUV) is based directly on CIE XYZ and is
;; another attampt to linearize the perceptibility of color
;; differences. The non-linear relations for L*, u*, and v* are given
;; below:
;;
;;         L* =  116 * (Y/Yn)1/3 - 16
;;         u* =  13L* * ( u' - un' )
;;         v* =  13L* * ( v' - vn' )
;;
;; The quantities un' and vn' refer to the reference white or the
;; light source; for the 2° observer and illuminant C, un' = 0.2009,
;; vn' = 0.4610 [ 1 ]. Equations for u' and v' are given below:
;;
;;         u' = 4X / (X + 15Y + 3Z) = 4x / ( -2x + 12y + 3 )
;;         v' = 9Y / (X + 15Y + 3Z) = 9y / ( -2x + 12y + 3 ).

;; Note: I have problem with the last step in the formulas above. It
;; just does not look ok and there are no definitions of X vs x etc...

;; See page 41 in http://www.scribd.com/doc/9413971/color-theory-and-modelling-for-computer-graphics
;;
;; Unfortunately I can't find out what the value of M below should be.
;; (color-xyz-values "white")
(defun color-cieluv-values (color)
  (let* ((xyz (color-xyz-values color))
         (x (nth 0 xyz))
         (y (nth 1 xyz))
         (z (nth 2 xyz))
         (div (+ x (* 15 y) (* 3 z)))
         (x-div (/ x div))
         (nan (/= x-div x-div))
         (u (if nan (/ 4 18) (* 4 x-div)))
         (v (if nan (/ 9 18) (* 9 x-div)))
         ;;(u (/ (* 4 x) (+ (* -2 x) (* 12 y) 3)))
         ;;(v (/ (* 9 x) (+ (* -2 x) (* 12 y) 3)))
         (y0 1) ;M) ;; ???
         (y/y0 (/ y y0))
         (L* (if (> y/y0 0.008856)
                 (- (* 25 (expt y/y0 0.333) 16))
               (* 903.29 y/y0)))
         (u0 0.201)
         (v0 0.461)
         (u* (* 13 L* (- u u0)))
         (v* (* 13 L* (- v v0))))
    (list L* u* v*)))

(defun cieluv-dist (color1 color2)
  (let* ((luv1 (color-cieluv-values color1))
         (luv2 (color-cieluv-values color2))
         (l-d (- (nth 0 luv1) (nth 0 luv2)))
         (u-d (- (nth 1 luv1) (nth 1 luv2)))
         (v-d (- (nth 2 luv1) (nth 2 luv2))))
    (sqrt (+ (* l-d l-d)
             (* u-d u-d)
             (* v-d v-d)))))

;;(cieluv-dist "black" "white")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Helpers

;;(color-to-sh6 "black")
;;(color-to-sh6 "white")
;;(color-to-sh6 "#fe0000")
(defun color-to-sh6 (color)
  "Return color in #..... format."
  (interactive (list (read-color "Color: ")))
  (let* ((rgb (mapcar (lambda (val) (/ val 256)) (color-values color)))
        (rgb-color (format "#%02X%02X%02X"
                           (nth 0 rgb)
                           (nth 1 rgb)
                           (nth 2 rgb))))
    (when (called-interactively-p)
      (message "%s" rgb-color))
    rgb-color))

;; (color-luminosity-contrast-ratio "white" "DarkGoldenrod")
;; (color-luminosity-contrast-ratio "white" "black")
;; (color-luminosity-contrast-ratio "white" "#050505")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; font-lock-color-test.el ends here
