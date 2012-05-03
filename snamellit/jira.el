<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head><title>EmacsWiki: jira.el</title><link rel="alternate" type="application/wiki" title="Edit this page" href="http://www.emacswiki.org/emacs?action=edit;id=jira.el" /><link type="text/css" rel="stylesheet" href="/emacs/wiki.css" /><meta name="robots" content="INDEX,FOLLOW" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki" href="http://www.emacswiki.org/emacs?action=rss" /><link rel="alternate" type="application/rss+xml" title="EmacsWiki: jira.el" href="http://www.emacswiki.org/emacs?action=rss;rcidonly=jira.el" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content"
      href="http://www.emacswiki.org/emacs/full.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki with page content and diff"
      href="http://www.emacswiki.org/emacs/full-diff.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Emacs Wiki including minor differences"
      href="http://www.emacswiki.org/emacs/minor-edits.rss" />
<link rel="alternate" type="application/rss+xml"
      title="Changes for jira.el only"
      href="http://www.emacswiki.org/emacs?action=rss;rcidonly=jira.el" />
<script type="text/javascript">
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-2101513-1']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/></head><body class="http://www.emacswiki.org/emacs"><div class="header"><a class="logo" href="http://www.emacswiki.org/emacs/SiteMap"><img class="logo" src="/emacs_logo.png" alt="[Home]" /></a><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span>
<!-- Google CSE Search Box Begins  -->
<form class="tiny" action="http://www.google.com/cse" id="searchbox_004774160799092323420:6-ff2s0o6yi"><p>
<input type="hidden" name="cx" value="004774160799092323420:6-ff2s0o6yi" />
<input type="text" name="q" size="25" />
<input type="submit" name="sa" value="Search" />
</p></form>
<script type="text/javascript" src="http://www.google.com/coop/cse/brand?form=searchbox_004774160799092323420%3A6-ff2s0o6yi"></script>
<!-- Google CSE Search Box Ends -->
<h1><a title="Click to search for references to this page" rel="nofollow" href="http://www.google.com/cse?cx=004774160799092323420:6-ff2s0o6yi&amp;q=%22jira.el%22">jira.el</a></h1></div><div class="wrapper"><div class="content browse"><p class="download"><a href="download/jira.el">Download</a></p><pre class="code"><span class="linecomment">;;; jira.el --- Connect to JIRA issue tracking software</span>

<span class="linecomment">;; Copyright (C) 2009 Brian Zwahr</span>
<span class="linecomment">;; original Copyright (C) 2007  Dave Benjamin</span>

<span class="linecomment">;; Authors: </span>
<span class="linecomment">;; Brian Zwahr &lt;echosa@gmail.com&gt;</span>
<span class="linecomment">;; Dave Benjamin &lt;dave@ramenlabs.com&gt;</span>
<span class="linecomment">;; Version: 0.3.3</span>
<span class="linecomment">;; Last modified: October 12, 2009</span>

<span class="linecomment">;; This file is free software; you can redistribute it and/or modify</span>
<span class="linecomment">;; it under the terms of the GNU General Public License as published by</span>
<span class="linecomment">;; the Free Software Foundation; either version 2, or (at your option)</span>
<span class="linecomment">;; any later version.</span>

<span class="linecomment">;; This file is distributed in the hope that it will be useful,</span>
<span class="linecomment">;; but WITHOUT ANY WARRANTY; without even the implied warranty of</span>
<span class="linecomment">;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the</span>
<span class="linecomment">;; GNU General Public License for more details.</span>

<span class="linecomment">;; You should have received a copy of the GNU General Public License</span>
<span class="linecomment">;; along with GNU Emacs; see the file COPYING.  If not, write to</span>
<span class="linecomment">;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,</span>
<span class="linecomment">;; Boston, MA 02110-1301, USA.</span>

<span class="linecomment">;;; **********</span>
<span class="linecomment">;;; Commentary</span>
<span class="linecomment">;;; **********</span>

<span class="linecomment">;; This file provides jira-mode, an emacs major mode for connecting to and </span>
<span class="linecomment">;; using a Jira server. (http://www.atlassian.com/software/jira/). This </span>
<span class="linecomment">;; jira-mode is far from complete (more below) but is mostly usable as is </span>
<span class="linecomment">;; for the features that are present.</span>

<span class="linecomment">;; Note that some functions/processes can be a bit slow. I believe this has </span>
<span class="linecomment">;; something to do with XMLRPC.</span>

<span class="linecomment">;; Also, XMLRPC access to jira is incomplete. Certain Jira features cannot be </span>
<span class="linecomment">;; used via XMLRPC such as (but not limited to):</span>
<span class="linecomment">;; - Changing ticket status</span>
<span class="linecomment">;; - Closing/resolving tickets</span>
<span class="linecomment">;; - Watching a ticket</span>

<span class="linecomment">;; All of the XML-RPC API is wrapped, though not all of the API is exposed</span>
<span class="linecomment">;; via interactive functions. For API details, see:</span>

<span class="linecomment">;; http://confluence.atlassian.com/pages/viewpage.action?pageId=1035</span>
<span class="linecomment">;; http://www.atlassian.com/software/jira/docs/api/rpc-jira-plugin/latest/com/atlassian/jira/rpc/xmlrpc/XmlRpcService.html</span>

<span class="linecomment">;;; *************</span>
<span class="linecomment">;;; Configuration</span>
<span class="linecomment">;;; *************</span>

<span class="linecomment">;; 1.) Load the file jira.el, either manuall or place (require 'jira) in your .emacs with jira.el in the load path.</span>
<span class="linecomment">;; 2.) Customize the variable jira-url to point to the XML-RPC url of the Jira</span>
<span class="linecomment">;; installation to be accessed.</span>
<span class="linecomment">;; 3.) The faces can be customized for different look/feel/highlighting.</span>

<span class="linecomment">;;; *****</span>
<span class="linecomment">;;; Usage</span>
<span class="linecomment">;;; *****</span>

<span class="linecomment">;; M-x jira-mode will load the major mode into a new buffer named *Jira*.</span>
<span class="linecomment">;; You will be asked to login; use the username/password for the Jira server.</span>
<span class="linecomment">;; A few internal lists should be populated automatically containing a list</span>
<span class="linecomment">;; of projects, issue types, etc. </span>

<span class="linecomment">;; The following commands/keyboard shorcuts can be used:</span>

<span class="linecomment">;; li - jira-list-issues</span>
<span class="linecomment">;; lp - jira-list-projects</span>
<span class="linecomment">;; lf - jira-list-filters</span>
<span class="linecomment">;; si - jira-search-issues</span>
<span class="linecomment">;; sp - jira-search-project-issues</span>
<span class="linecomment">;; i - jira-show-issue</span>
<span class="linecomment">;; c - jira-create-ticket</span>
<span class="linecomment">;; o - jira-comment-ticket</span>
<span class="linecomment">;; r - jira-refresh-ticket</span>
<span class="linecomment">;; a - jira-assign-ticket</span>
<span class="linecomment">;; n - jira-next-comment</span>
<span class="linecomment">;; p - jira-previous-comment</span>
<span class="linecomment">;; jl - jira-login</span>
<span class="linecomment">;; jL - jira-logout</span>
<span class="linecomment">;; Q - jira-mode-quit</span>

<span class="linecomment">;; When viewing an issues, pressing o, r, etc. acts upon that issue. </span>
<span class="linecomment">;; For instance, while viewing an issue, pressing o will ask for a comment. </span>
<span class="linecomment">;; That comment will be posted to the issue currently being viewed.</span>

<span class="linecomment">;; Some prompts have tab completions in the minibuffer/echo area. Try it out to</span>
<span class="linecomment">;; see which prompts do and which do not.</span>

<span class="linecomment">;;; Code:</span>
(require 'cl)
(require 'xml-rpc)

<span class="linecomment">;; **************************</span>
<span class="linecomment">;; Jira Mode - by Brian Zwahr</span>
<span class="linecomment">;; **************************</span>

(defgroup jira nil
  "<span class="quote">Jira customization group.</span>"
  :group 'applications)

(defgroup jira-faces nil 
  "<span class="quote">Faces for displaying Jira information.</span>"
  :group 'jira)

(defcustom jira-url "<span class="quote"></span>"
  "<span class="quote">User customizable URL to Jira server.</span>"
  :group 'jira
  :type 'string
  :initialize 'custom-initialize-set)

(defface jira-issue-info-face
  '((t (:foreground "<span class="quote">black</span>" :background "<span class="quote">yellow4</span>")))
  "<span class="quote">Base face for issue information.</span>"
  :group 'jira-faces)

(defface jira-issue-info-header-face
  '((t (:bold t :inherit 'jira-issue-info-face)))
  "<span class="quote">Base face for issue headers.</span>"
  :group 'jira-faces)

(defface jira-issue-summary-face
  '((t (:bold t)))
  "<span class="quote">Base face for issue summary.</span>"
  :group 'jira-faces)

(defface jira-comment-face
  '((t (:background "<span class="quote">gray23</span>")))
  "<span class="quote">Base face for comments.</span>"
  :group 'jira-faces)

(defface jira-comment-header-face
  '((t (:bold t)))
  "<span class="quote">Base face for comment headers.</span>"
  :group 'jira-faces)

(defface jira-link-issue-face
  '((t (:underline t)))
  "<span class="quote">Face for linked issues.</span>"
  :group 'jira-faces)

(defface jira-link-project-face
  '((t (:underline t)))
  "<span class="quote">Face for linked projects</span>"
  :group 'jira-faces)

(defface jira-link-filter-face
  '((t (:underline t)))
  "<span class="quote">Face for linked filters</span>"
  :group 'jira-faces)

(defvar jira-mode-hook nil)

(defvar jira-mode-map nil)

(if jira-mode-map
    nil
  (progn
    (setq jira-mode-map (make-sparse-keymap))
    (define-key jira-mode-map "<span class="quote">li</span>" 'jira-list-issues)
    (define-key jira-mode-map "<span class="quote">lp</span>" 'jira-list-projects)
    (define-key jira-mode-map "<span class="quote">lf</span>" 'jira-list-filters)
    (define-key jira-mode-map "<span class="quote">si</span>" 'jira-search-issues)
    (define-key jira-mode-map "<span class="quote">sp</span>" 'jira-search-project-issues)
    (define-key jira-mode-map "<span class="quote">i</span>" 'jira-show-issue)
    (define-key jira-mode-map "<span class="quote">c</span>" 'jira-create-ticket)
    (define-key jira-mode-map "<span class="quote">o</span>" 'jira-comment-ticket)
    (define-key jira-mode-map "<span class="quote">r</span>" 'jira-refresh-ticket)
    (define-key jira-mode-map "<span class="quote">a</span>" 'jira-assign-ticket)
    (define-key jira-mode-map "<span class="quote">n</span>" 'jira-next-comment)
    (define-key jira-mode-map "<span class="quote">p</span>" 'jira-previous-comment)
    (define-key jira-mode-map "<span class="quote">jl</span>" 'jira-login)
    (define-key jira-mode-map "<span class="quote">jL</span>" 'jira-logout)
    (define-key jira-mode-map "<span class="quote">Q</span>" 'jira-mode-quit)
    (define-key jira-mode-map [return] 'jira-return)))

(defun jira-mode ()
  "<span class="quote">A mode for working with the Jira ticketing system. XMLRPC is used via xmlrpc.el. Things run a bit slow, though sometimes they seems to run faster when doing multiple things at once to the same ticket: i.e. retrieve a ticket, its slow, comment the tickets, its faster, refresh the ticket its faster, wait a while then refresh and its slow again. 

\\{jira-mode-map}</span>"
  (interactive)
  (if (or (equal jira-url nil)
          (equal jira-url "<span class="quote"></span>"))
      (message "<span class="quote">jira-url not set! Please use 'M-x customize-variable RET jira-url RET'!</span>")
    (progn
      (switch-to-buffer "<span class="quote">*Jira*</span>")
      (kill-all-local-variables)
      (setq major-mode 'jira-mode)
      (setq mode-name "<span class="quote">Jira</span>")
      (use-local-map jira-mode-map)
      (run-hooks 'jira-mode-hook)
      (jira-store-projects)
      (jira-store-priorities)
      (jira-store-statuses)
      (jira-store-types)
      (insert "<span class="quote">Welcome to jira-mode!</span>")
      (message "<span class="quote">jira mode loaded!</span>"))))

(defvar jira-current-issue nil
  "<span class="quote">This holds the currently selected issue.</span>")

(defvar jira-projects-list nil
  "<span class="quote">This holds a list of projects and their details.</span>")

(defvar jira-types nil
  "<span class="quote">This holds a list of issues types.</span>")

(defvar jira-statuses nil
  "<span class="quote">This holds a list of statuses.</span>")

(defvar jira-priorities nil
  "<span class="quote">This holds a list of priorities.</span>")

(defvar jira-user-fullnames nil
  "<span class="quote">This holds a list of user fullnames.</span>")

(defun jira-mode-quit ()
  (interactive)
  (jira-logout)
  (kill-buffer "<span class="quote">*Jira*</span>"))

(defun jira-create-ticket (project type summary description)
  (interactive (list (read-string "<span class="quote">Project: </span>")
                     (read-string "<span class="quote">Type: </span>")
                     (read-string "<span class="quote">Summary: </span>")
                     (read-string "<span class="quote">Description: </span>")))
  (if (or (equal project "<span class="quote"></span>")
          (equal type "<span class="quote"></span>")
          (equal summary "<span class="quote"></span>")
          (equal description "<span class="quote"></span>"))
      (message "<span class="quote">Must provide all information!</span>")
    (progn
      (setq ticket-alist (list (cons "<span class="quote">project</span>" project) 
                               (cons "<span class="quote">type</span>" type) 
                               (cons "<span class="quote">summary</span>" summary) 
                               (cons "<span class="quote">description</span>" description)))
      (jira-create-issue ticket-alist))))

(defun jira-refresh-ticket ()
  (interactive)
  (jira-show-issue jira-current-issue))

(defun jira-comment-ticket (comment)
  (interactive (list (read-string "<span class="quote">Comment: </span>")))
  (if (equal comment "<span class="quote"></span>")
      (message "<span class="quote">Must provide comment!</span>")
    (progn
      (jira-add-comment jira-current-issue comment)
      (jira-refresh-ticket))))

(defun jira-assign-ticket (assignee)
  (interactive (list (read-string "<span class="quote">Assignee: </span>")))
  (if (equal assignee "<span class="quote"></span>")
      (message "<span class="quote">Must provide assignee!</span>")
    (progn
      (setq ticket-alist (list (cons "<span class="quote">assignee</span>" (vector assignee))))
      (jira-update-issue jira-current-issue ticket-alist)
      (jira-refresh-ticket))))

(defun jira-update-ticket-summary (summary)
  (interactive (list (read-string "<span class="quote">Summary: </span>")))
  (if (equal summary "<span class="quote"></span>")
      (message "<span class="quote">Must provide summary!</span>")
    (progn
      (setq ticket-alist (list (cons "<span class="quote">summary</span>" (vector summary))))
      (jira-update-issue jira-current-issue ticket-alist)
      (jira-refresh-ticket))))

(defun jira-start-ticket ()
  (interactive)
  (setq ticket-alist (list (cons "<span class="quote">status</span>" (vector "<span class="quote">3</span>"))))
  (jira-update-issue jira-current-issue ticket-alist))

(defun jira-store-projects ()
  (setf jira-projects-list (jira-get-projects)))

(defun jira-store-types ()
  (setf jira-types (jira-get-issue-types)))

(defun jira-store-statuses ()
  (setf jira-statuses (jira-get-statuses)))

(defun jira-store-priorities ()
  (setf jira-priorities (jira-get-priorities)))

(defun jira-get-project-name (key)
  (let ((projects jira-projects-list)
        (name nil))
    (dolist (project projects)
      (if (equal (cdr (assoc "<span class="quote">key</span>" project)) key)
          (setf name (cdr (assoc "<span class="quote">name</span>" project)))))
    name))

(defun jira-get-type-name (id)
  (let ((types jira-types)
        (name nil))
    (dolist (type types)
      (if (equal (cdr (assoc "<span class="quote">id</span>" type)) id)
          (setf name (cdr (assoc "<span class="quote">name</span>" type)))))
    name))

(defun jira-get-status-name (id)
  (let ((statuses jira-statuses)
        (name nil))
    (dolist (status statuses)
      (if (equal (cdr (assoc "<span class="quote">id</span>" status)) id)
          (setf name (cdr (assoc "<span class="quote">name</span>" status)))))
    name))

(defun jira-get-priority-name (id)
  (let ((priorities jira-priorities)
        (name nil))
    (dolist (priority priorities)
      (if (equal (cdr (assoc "<span class="quote">id</span>" priority)) id)
          (setf name (cdr (assoc "<span class="quote">name</span>" priority)))))
    (message name)))

(defun jira-get-user-fullname (username)
  (if (assoc username jira-user-fullnames)
      (cdr (assoc username jira-user-fullnames))
    (progn
      (let ((user (jira-get-user username)))
        (setf jira-user-fullnames (append jira-user-fullnames (list (cons username (cdr (assoc "<span class="quote">fullname</span>" user))))))
        (cdr (assoc "<span class="quote">fullname</span>" user))))))

(defun jira-next-comment ()
  (interactive)
  (let ((p (point)))
    (if (search-forward "<span class="quote">Comment #</span>" nil t)
        (progn
          (if (equal p (- (point) 9))
              (search-forward "<span class="quote">Comment #</span>" nil t))
          (recenter 0)
          (beginning-of-line)))))

(defun jira-previous-comment ()
  (interactive)
  (if (search-backward "<span class="quote">Comment #</span>" nil t)
      (progn
        (recenter 0)
        (beginning-of-line))
    (goto-char 0)))

(defun jira-return ()
  (interactive)
  (if (equal (face-at-point) 'jira-link-issue-face)
      (jira-show-issue (thing-at-point 'sexp)))
  (if (equal (face-at-point) 'jira-link-project-face)
      (jira-search-project-issues (thing-at-point 'sexp) "<span class="quote"></span>" 20))
  (if (equal (face-at-point) 'jira-link-filter-face)
      (jira-list-issues (thing-at-point 'sexp))))

(defun point-on-issue-p ()
  (save-excursion
    (search-backward "<span class="quote"> </span>")))

(defun delete-eob-whitespace ()
  (end-of-buffer)
  (delete-horizontal-space)
  (delete-char -1)
  (beginning-of-buffer))

<span class="linecomment">;; ***********************************</span>
<span class="linecomment">;; original functions by Dave Benjamin</span>
<span class="linecomment">;; modifications by Brian Zwahr noted</span>
<span class="linecomment">;; ***********************************</span>

(defvar jira-token nil
  "<span class="quote">JIRA token used for authentication</span>")

(defun jira-login (username password)
  "<span class="quote">Logs the user into JIRA.</span>"
  (interactive (list (read-string "<span class="quote">Username: </span>")
                     (read-passwd "<span class="quote">Password: </span>")))
  (setq jira-token (jira-call-noauth 'jira1.login username password)))

(defun jira-logout ()
  "<span class="quote">Logs the user out of JIRA</span>"
  (interactive)
  (jira-call 'jira1.logout)
  (setq jira-token nil))

(defun jira-list-projects ()
  "<span class="quote">Displays a list of all available JIRA projects</span>"
  (interactive)
  (let ((projects (jira-get-projects)))
    (jira-with-jira-buffer
     (insert (number-to-string (length projects)) "<span class="quote"> JIRA projects found:\n\n</span>")
     (dolist (project projects)
       (insert (format "<span class="quote">%-12s</span>" "<span class="quote"> </span>"))
       (beginning-of-line)
       (add-text-properties
        (point)
        (save-excursion
          (insert 
           (cdr (assoc "<span class="quote">key</span>" project)))
          (point))
        '(face jira-link-project-face))
       (beginning-of-line)
       (forward-char 12)
       (insert (format "<span class="quote">%s\n</span>"
                       (cdr (assoc "<span class="quote">name</span>" project)))))))
  (delete-eob-whitespace))

(defun jira-list-filters ()
  "<span class="quote">Displays a list of all saved JIRA filters</span>"
  (interactive)
  (let ((filters (jira-get-saved-filters)))
    (jira-with-jira-buffer
     (insert (number-to-string (length filters)) "<span class="quote"> JIRA filters found:\n\n</span>")
     (dolist (filter filters)
       (insert (format "<span class="quote">%-8s</span>" "<span class="quote"> </span>"))
       (beginning-of-line)
       (add-text-properties
        (point)
        (save-excursion
          (insert (cdr (assoc "<span class="quote">id</span>" filter)))
          (point))
        '(face jira-link-filter-face))
       (beginning-of-line)
       (forward-char 8)
       (insert (format "<span class="quote"> %s\n</span>"
                       (cdr (assoc "<span class="quote">name</span>" filter)))))))
  (delete-eob-whitespace))

(defun jira-list-issues (filter-id)
  "<span class="quote">Displays a list of issues matching a filter</span>"
  (interactive
   (list (let ((filter-alist (jira-get-filter-alist)))
           (cdr (assoc (completing-read "<span class="quote">Filter: </span>" filter-alist nil t)
                filter-alist)))))
    (when filter-id
      (let ((filter (jira-get-filter filter-id))
            (issues (jira-get-issues-from-filter filter-id)))
        (jira-with-jira-buffer
         (insert "<span class="quote">Filter:\n</span>" (cdr (assoc "<span class="quote">name</span>" filter))
                 "<span class="quote"> (</span>" (cdr (assoc "<span class="quote">id</span>" filter)) "<span class="quote">)\n\n</span>")
         (when (cdr (assoc "<span class="quote">description</span>" filter))
           (insert "<span class="quote">Description:\n</span>")
           (let ((start (point)))
             (insert (cdr (assoc "<span class="quote">description</span>" filter)) "<span class="quote">\n\n</span>")
             (fill-region start (point))))
         (jira-display-issues issues)))))

(defun jira-search-issues (text)
  "<span class="quote">Displays a list of issues maching a fulltext search</span>"
  (interactive "<span class="quote">sSearch: </span>")
  (let ((issues (jira-get-issues-from-text-search text)))
    (jira-with-jira-buffer
     (insert "<span class="quote">Search: </span>" text "<span class="quote">\n\n</span>")
     (jira-display-issues issues))))

(defun jira-search-project-issues (project text max-results)
  "<span class="quote">Displays a list of issues within a project matching a fulltext search</span>"
  (interactive
   (let ((project-keys
          (mapcar (lambda (project)
                    (cdr (assoc "<span class="quote">key</span>" project)))
                  (jira-get-projects))))
     (list
      (completing-read "<span class="quote">Project Key: </span>" project-keys nil t)
      (read-string "<span class="quote">Search: </span>")
      (read-number "<span class="quote">Max Results: </span>" 20))))
  (let ((issues (jira-get-issues-from-text-search-with-project
                 (list project) (if (equal text "<span class="quote"></span>") "<span class="quote"> </span>" text) max-results)))
    (jira-with-jira-buffer
     (insert "<span class="quote">Project Key: </span>" project "<span class="quote">\n</span>"
             "<span class="quote">Search: </span>" text "<span class="quote">\n</span>"
             "<span class="quote">Max Results: </span>" (number-to-string max-results) "<span class="quote">\n\n</span>")
     (jira-display-issues issues))))

<span class="linecomment">; Modified by Brian Zwahr to store issue key and improve layout/readability.</span>
(defun jira-show-issue (issue-key)
  "<span class="quote">Displays details about a particular issue.</span>"
  (interactive "<span class="quote">sIssue Key: </span>")
  (let ((issue (jira-get-issue issue-key))
        (comments (jira-get-comments issue-key)))
    (setf jira-current-issue issue-key)
    (jira-with-jira-buffer
     (setq truncate-lines nil)
     (let ((s "<span class="quote">Project:   </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (jira-get-project-name (cdr (assoc "<span class="quote">project</span>" issue)))))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n</span>"))

     (let ((s "<span class="quote">Key:       </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (cdr (assoc "<span class="quote">key</span>" issue))))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n</span>"))

     (let ((s "<span class="quote">Type:      </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (jira-get-type-name (cdr (assoc "<span class="quote">type</span>" issue)))))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n</span>"))

     (let ((s "<span class="quote">Status:    </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (jira-get-status-name (cdr (assoc "<span class="quote">status</span>" issue)))))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n</span>"))

     (let ((s "<span class="quote">Priority:  </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (jira-get-priority-name (cdr (assoc "<span class="quote">priority</span>" issue)))))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n</span>"))

     (let ((s "<span class="quote">Assignee:  </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (jira-get-user-fullname (cdr (assoc "<span class="quote">assignee</span>" issue)))))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n</span>"))

     (let ((s "<span class="quote">Reporter:  </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (jira-get-user-fullname (cdr (assoc "<span class="quote">reporter</span>" issue)))))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n</span>"))

     (let ((s "<span class="quote">Created:   </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (cdr (assoc "<span class="quote">created</span>" issue))))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n</span>"))

     (let ((s "<span class="quote">Updated:   </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (cdr (assoc "<span class="quote">updated</span>" issue))))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n</span>"))

     (let ((s "<span class="quote">Watchers:  </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s "<span class="quote">N/A</span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n\n</span>"))

     (let ((s "<span class="quote">Component(s): </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (if (cdr (assoc "<span class="quote">components</span>" issue)) (cdr (assoc "<span class="quote">components</span>" issue)) "<span class="quote">None</span>")))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n\n</span>"))

     (let ((s "<span class="quote">Fix Version(s): </span>"))
       (put-text-property 0 (length s) 'face 'jira-issue-info-header-face s)
       (insert s))
     (let ((s (if (cdr (assoc "<span class="quote">fixVersions</span>" issue)) (cdr (assoc "<span class="quote">fixVersions</span>" issue)) "<span class="quote">None</span>")))
       (put-text-property 0 (length s) 'face 'jira-issue-info-face s)
       (insert s "<span class="quote">\n\n</span>"))

     (let ((s (cdr (assoc "<span class="quote">summary</span>" issue))))
       (put-text-property 0 (length s) 'face 'jira-issue-summary-face s)
       (insert s "<span class="quote">\n\n</span>"))

     (insert (concatenate 'string (cdr (assoc "<span class="quote">description</span>" issue)) "<span class="quote">\n\n</span>"))

     (when comments
       (let ((count 1))
         (dolist (comment comments)
           (insert "<span class="quote">Comment #</span>" (int-to-string count) "<span class="quote">\n</span>")
           (let ((s (concatenate 'string (jira-get-user-fullname (cdr (assoc "<span class="quote">author</span>" comment))) "<span class="quote"> - </span>" (cdr (assoc "<span class="quote">created</span>" comment)))))
             (put-text-property 0 (length s) 'face 'jira-comment-header-face s)
             (insert s "<span class="quote">\n</span>"))
           (let ((c (jira-strip-cr (cdr (assoc "<span class="quote">body</span>" comment)))))
             
             (put-text-property 0 (length c) 'face 'jira-comment-face c)
             (insert c "<span class="quote">\n\n</span>"))
           (setf count (1+ count))))))))

(defun jira-send-region-as-comment (start end issue-key)
  "<span class="quote">Send the currently selected region as an issue comment</span>"
  (interactive "<span class="quote">r\nsIssue Key: </span>")
  (jira-add-comment issue-key (buffer-substring start end)))

(defun jira-get-filter (filter-id)
  "<span class="quote">Returns a filter given its filter ID.</span>"
  (flet ((id-match (filter)
                   (equal filter-id (cdr (assoc "<span class="quote">id</span>" filter)))))
    (find-if 'id-match (jira-get-saved-filters))))

(defun jira-get-filter-alist ()
  "<span class="quote">Returns an association list mapping filter names to IDs</span>"
  (mapcar (lambda (filter)
            (cons (cdr (assoc "<span class="quote">name</span>" filter))
                  (cdr (assoc "<span class="quote">id</span>" filter))))
          (jira-get-saved-filters)))

(defun jira-get-status-abbrevs ()
  "<span class="quote">Returns an association list of status IDs to abreviated names</span>"
  (flet ((pair (status)
               (cons (cdr (assoc "<span class="quote">id</span>" status))
                     (let ((status-name (cdr (assoc "<span class="quote">name</span>" status))))
                       (substring (replace-regexp-in-string
                                   "<span class="quote"> *</span>" "<span class="quote"></span>" status-name)
                                  0 (min 3 (length status-name)))))))
    (mapcar 'pair (jira-get-statuses))))

(defun jira-display-issues (issues)
  "<span class="quote">Inserts a list of issues into the current buffer</span>"
  (let ((status-abbrevs (jira-get-status-abbrevs))
        (last-status))
    (insert (number-to-string (length issues))
            "<span class="quote"> JIRA issues found:\n</span>")
    (dolist (issue issues)
      (let ((status (cdr (assoc "<span class="quote">status</span>" issue)))
            (priority (cdr (assoc "<span class="quote">priority</span>" issue))))
        (when (not (equal last-status status))
          (setq last-status status)
          (insert "<span class="quote">\n</span>"))
        (insert (format "<span class="quote">%-16s</span>" "<span class="quote"> </span>"))
        (beginning-of-line)
        (add-text-properties
         (point)
         (save-excursion
           (insert 
            (cdr (assoc "<span class="quote">key</span>" issue)))
           (point))
         '(face jira-link-issue-face))
        (beginning-of-line)
        (forward-char 16)
        (insert (format "<span class="quote">%-10s %s %5s %s\n</span>"
                        (cdr (assoc "<span class="quote">assignee</span>" issue))
                        (cdr (assoc status status-abbrevs))
                        (if priority
                            (make-string (- 6 (string-to-number priority))
                                         ?*)
                          "<span class="quote"></span>")
                        (cdr (assoc "<span class="quote">summary</span>" issue)))))))
  (delete-eob-whitespace))

(defun jira-add-comment (issue-key comment)
  "<span class="quote">Adds a comment to an issue</span>"
  (jira-call 'jira1.addComment issue-key comment))

(defun jira-create-issue (r-issue-struct)
  "<span class="quote">Creates an issue in JIRA from a Hashtable object.</span>"
  (jira-call 'jira1.createIssue r-issue-struct))

(defun jira-get-comments (issue-key)
  "<span class="quote">Returns all comments associated with the issue</span>"
  (jira-call 'jira1.getComments issue-key))

(defun jira-get-components (project-key)
  "<span class="quote">Returns all components available in the specified project</span>"
  (jira-call 'jira1.getComponents project-key))

(defun jira-get-issue (issue-key)
  "<span class="quote">Gets an issue from a given issue key.</span>"
  (jira-call 'jira1.getIssue issue-key))

(defun jira-get-issues-from-filter (filter-id)
  "<span class="quote">Executes a saved filter</span>"
  (jira-call 'jira1.getIssuesFromFilter filter-id))

(defun jira-get-issues-from-text-search (search-terms)
  "<span class="quote">Find issues using a free text search</span>"
  (jira-call 'jira1.getIssuesFromTextSearch search-terms))

(defun jira-get-issues-from-text-search-with-project
  (project-keys search-terms max-num-results)
  "<span class="quote">Find issues using a free text search, limited to certain projects</span>"
  (jira-call 'jira1.getIssuesFromTextSearchWithProject
             project-keys search-terms max-num-results))

(defun jira-get-issue-types ()
  "<span class="quote">Returns all visible issue types in the system</span>"
  (jira-call 'jira1.getIssueTypes))

(defun jira-get-priorities ()
  "<span class="quote">Returns all priorities in the system</span>"
  (jira-call 'jira1.getPriorities))

<span class="linecomment">;; Modified by Brian Zwahr to use getProjectsNoSchemes instead of getProjects</span>
(defun jira-get-projects ()
  "<span class="quote">Returns a list of projects available to the user</span>"
  (jira-call 'jira1.getProjectsNoSchemes))

(defun jira-get-resolutions ()
  "<span class="quote">Returns all resolutions in the system</span>"
  (jira-call 'jira1.getResolutions))

(defun jira-get-saved-filters ()
  "<span class="quote">Gets all saved filters available for the currently logged in user</span>"
  (jira-call 'jira1.getSavedFilters))

(defun jira-get-server-info ()
  "<span class="quote">Returns the Server information such as baseUrl, version, edition, buildDate, buildNumber.</span>"
  (jira-call 'jira1.getServerInfo))

(defun jira-get-statuses ()
  "<span class="quote">Returns all statuses in the system</span>"
  (jira-call 'jira1.getStatuses))

(defun jira-get-sub-task-issue-types ()
  "<span class="quote">Returns all visible subtask issue types in the system</span>"
  (jira-call 'jira1.getSubTaskIssueTypes))

(defun jira-get-user (username)
  "<span class="quote">Returns a user's information given a username</span>"
  (jira-call 'jira1.getUser username))

(defun jira-get-versions (project-key)
  "<span class="quote">Returns all versions available in the specified project</span>"
  (jira-call 'jira1.getVersions project-key))

(defun jira-update-issue (issue-key field-values)
  "<span class="quote">Updates an issue in JIRA from a Hashtable object.</span>"
  (jira-call 'jira1.updateIssue issue-key field-values))

(defun jira-ensure-token ()
  "<span class="quote">Makes sure that a JIRA token has been set, logging in if necessary.</span>"
  (unless jira-token
    (jira-login (read-string "<span class="quote">Username: </span>")
                (read-passwd "<span class="quote">Password: </span>"))))

(defun jira-call (method &rest params)
  "<span class="quote">Calls an XML-RPC method on the JIRA server (low-level)</span>"
  (jira-ensure-token)
  (apply 'jira-call-noauth method jira-token params))

(defun jira-call-noauth (method &rest params)
  "<span class="quote">Calls an XML-RPC method on the JIRA server without authentication (low-level)</span>"
  (let ((url-version "<span class="quote">Exp</span>")             <span class="linecomment">; hack due to status bug in xml-rpc.el</span>
        (server-url jira-url))
    (apply 'xml-rpc-method-call server-url method params)))

(defun jira-strip-cr (string)
  "<span class="quote">Removes carriage returns from a string</span>"
  (when string (replace-regexp-in-string "<span class="quote">\r</span>" "<span class="quote"></span>" string)))

<span class="linecomment">;; Modified by Brian Zwahr to a specific *Jira* buffer, not a temp buffer</span>
(defmacro jira-with-jira-buffer (&rest body)
  "<span class="quote">Sends all output and buffer modifications to *Jira* buffer.</span>"
  `(with-current-buffer "<span class="quote">*Jira*</span>" 
     (delete-region (point-min) (point-max))
     (setq truncate-lines t)
     ,@body
     (beginning-of-buffer)))

(provide 'jira)
<span class="linecomment">;;; jira.el ends here</span></span></pre></div><div class="wrapper close"></div></div><div class="footer"><hr /><span class="gotobar bar"><a class="local" href="http://www.emacswiki.org/emacs/SiteMap">SiteMap</a> <a class="local" href="http://www.emacswiki.org/emacs/Search">Search</a> <a class="local" href="http://www.emacswiki.org/emacs/ElispArea">ElispArea</a> <a class="local" href="http://www.emacswiki.org/emacs/HowTo">HowTo</a> <a class="local" href="http://www.emacswiki.org/emacs/Glossary">Glossary</a> <a class="local" href="http://www.emacswiki.org/emacs/RecentChanges">RecentChanges</a> <a class="local" href="http://www.emacswiki.org/emacs/News">News</a> <a class="local" href="http://www.emacswiki.org/emacs/Problems">Problems</a> <a class="local" href="http://www.emacswiki.org/emacs/Suggestions">Suggestions</a> </span><span class="translation bar"><br />  <a class="translation new" rel="nofollow" href="http://www.emacswiki.org/emacs?action=translate;id=jira.el;missing=de_en_es_fr_it_ja_ko_pt_ru_se_zh">Add Translation</a></span><span class="edit bar"><br /> <a class="edit" accesskey="e" title="Click to edit this page" rel="nofollow" href="http://www.emacswiki.org/emacs?action=edit;id=jira.el">Edit this page</a> <a class="history" rel="nofollow" href="http://www.emacswiki.org/emacs?action=history;id=jira.el">View other revisions</a> <a class="admin" rel="nofollow" href="http://www.emacswiki.org/emacs?action=admin;id=jira.el">Administration</a></span><span class="time"><br /> Last edited 2009-10-12 21:23 UTC by <a class="author" title="from bloc-bzwahr-lap.tamu.edu" href="http://www.emacswiki.org/emacs/echosa">echosa</a> <a class="diff" rel="nofollow" href="http://www.emacswiki.org/emacs?action=browse;diff=2;id=jira.el">(diff)</a></span><div style="float:right; margin-left:1ex;">
<!-- Creative Commons License -->
<a href="http://creativecommons.org/licenses/GPL/2.0/"><img alt="CC-GNU GPL" style="border:none" src="/pics/cc-GPL-a.png" /></a>
<!-- /Creative Commons License -->
</div>

<!--
<rdf:RDF xmlns="http://web.resource.org/cc/"
 xmlns:dc="http://purl.org/dc/elements/1.1/"
 xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<Work rdf:about="">
   <license rdf:resource="http://creativecommons.org/licenses/GPL/2.0/" />
  <dc:type rdf:resource="http://purl.org/dc/dcmitype/Software" />
</Work>

<License rdf:about="http://creativecommons.org/licenses/GPL/2.0/">
   <permits rdf:resource="http://web.resource.org/cc/Reproduction" />
   <permits rdf:resource="http://web.resource.org/cc/Distribution" />
   <requires rdf:resource="http://web.resource.org/cc/Notice" />
   <permits rdf:resource="http://web.resource.org/cc/DerivativeWorks" />
   <requires rdf:resource="http://web.resource.org/cc/ShareAlike" />
   <requires rdf:resource="http://web.resource.org/cc/SourceCode" />
</License>
</rdf:RDF>
-->

<p class="legal">
This work is licensed to you under version 2 of the
<a href="http://www.gnu.org/">GNU</a> <a href="/GPL">General Public License</a>.
Alternatively, you may choose to receive this work under any other
license that grants the right to use, copy, modify, and/or distribute
the work, as long as that license imposes the restriction that
derivative works have to grant the same rights and impose the same
restriction. For example, you may choose to receive this work under
the
<a href="http://www.gnu.org/">GNU</a>
<a href="/FDL">Free Documentation License</a>, the
<a href="http://creativecommons.org/">CreativeCommons</a>
<a href="http://creativecommons.org/licenses/sa/1.0/">ShareAlike</a>
License, the XEmacs manual license, or
<a href="/OLD">similar licenses</a>.
</p>
</div>
</body>
</html>
