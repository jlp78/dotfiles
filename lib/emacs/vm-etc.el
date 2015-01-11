(setq vm-auto-folder-alist
      '(("Resent-From"
	 ("^lds-request..*$" . "lds")
;	 ("reg-exp" . "folder-name")
	 )
	("Subject"
	 (".*[Ee]-[Pp][Bb][Mm].*" . "trav-game")
	 (".*[Pp][Bb][Ee][Mm].*" . "trav-game")
	 (".*[Pp][Bb][Mm].*" . "trav-game")
	 (".*Suns-at-Home Digest.*" . "sah")
;	 ("reg-exp" . "folder-name")
	 )
	("From"
	 ("^.*Richard Johnson.*$" . "trav-game")
	 ("^.*Distributed Systems Support Team Database.*$" . "problem")
;	 ("reg-exp" . "folder-name")
	 )
	("Sender"
	 ("^sun-managers-relay@eecs\.nwu\.edu$" . "sun-stuff")
	 ("^.*BIG-LAN@SUVM\.ACS\.SYR\.EDU.*$" . "big-lan")
	 ("^Sun-Nets-request@umiacs\.UMD\.EDU$" . "net-stuff")
	 ("^.*BYUCSR-L.*$" . "csr")
;	 ("reg-exp" . "folder-name")
	 )
	("Reply-To"
	 ("^.*traveller-request.*$" . "trav")
;	 ("reg-exp" . "folder-name")
	 )
	("From"
	 ("^.*microsoft!ericbr.*$" . "ecb")
;	 ("reg-exp" . "folder-name")
	 )
	("To"
	 (".*[Ii][Ee][Tt][Ff].*" . "ietf")
	 (".*operlist[@%][Ll]egato.[Cc][Oo][Mm].*" . "irc")
	 (".*irclist@.*" . "irc")
	 (".*irclist@.*" . "irc")
	 (".*csr-list@.*" . "csr")
	 (".*ACinfo@.*" . "acmaint")
	 (".*ripe-map@.*" . "maps")
	 (".*pbem.*" . "trav-game")
;	 ("reg-exp" . "folder-name")
	 )
	("Cc"
	 (".*ietf.*" . "ietf")
	 (".*operlist@Legato.COM" . "irc")
	 (".*irclist@.*" . "irc")
	 (".*pbem.*" . "trav-game")
;	 ("reg-exp" . "folder-name")
	 )
	("Status"
	 (".*RO.*" . "misc")
	 )
;	("Header-name"
;	 ("reg-exp" . "folder-name")
;	 ("reg-exp" . "folder-name")
;	 )
      ))

(setq vm-folder-directory "~/.folders")
(setq vm-delete-after-saving t)
(setq vm-move-after-deleting t)
(setq vm-startup-with-summary 1)
