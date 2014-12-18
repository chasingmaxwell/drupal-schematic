; This file contains configuration which applies in both local development and
; remote deployment and should be included by all other make files.


;; -----------------------------------------------------------------------------
;; Core & Required Configuration
;; -----------------------------------------------------------------------------
;; Usually you will not need to edit configuration in this section.

core = 7.x
api = 2
defaults[projects][subdir] = contrib

; drops-7
; -----------------------------------------------------------------------------
projects[drops_7][type] = core
projects[drops_7][download][type] = git
projects[drops_7][download][url] = git@github.com:pantheon-systems/drops-7.git
projects[drops_7][download][branch] = master
projects[drops_7][download][revision] = ea54cb1d6318517582e7258e880ce02ab5a2cbfd

; Master
; -----------------------------------------------------------------------------
; This module is required for the automated enabling/disabling of modules in the
; build and deploy scripts.
projects[master][version] = 2.0-beta3

; Features
; -----------------------------------------------------------------------------
; This module is required for the reverting of features in the build and deploy
; scripts.
projects[features][version] = 2.2


;; -----------------------------------------------------------------------------
;; Custom Configuration
;; -----------------------------------------------------------------------------
;; Add custom configuration below this line.
