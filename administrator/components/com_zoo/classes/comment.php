<?php
/**
* @package   ZOO Component
* @file      comment.php
* @version   2.0.3 July 2010
* @author    YOOtheme http://www.yootheme.com
* @copyright Copyright (C) 2007 - 2010 YOOtheme GmbH
* @license   http://www.gnu.org/licenses/gpl-2.0.html GNU/GPLv2 only
*/

/*
	Class: Comment
		Comment related attributes and functions.
*/
class Comment extends YObject {

	/*
       Class constants
    */
	const STATE_UNAPPROVED = 0;
	const STATE_APPROVED = 1;
	const STATE_SPAM = 2;

	/*
       Variable: id
         Primary key.
    */
	public $id;

	/*
       Variable: parent_id
         Comment parent.
    */
	public $parent_id;
		
    /*
       Variable: item_id
         Item id.
    */
	public $item_id;

    /*
       Variable: user_id
         User id.
    */	
	public $user_id;

    /*
       Variable: user_type
         User type.
    */	
	public $user_type;
	
	/*
       Variable: author
         Author name.
    */
	public $author;

	/*
       Variable: email
         Author email.
    */
	public $email;
	
	/*
       Variable: url
         Author url.
    */
	public $url;
	
	/*
       Variable: ip
         Author ip.
    */
	public $ip;
	
	/*
       Variable: created
         Comment creation date.
    */
	public $created;
		
	/*
       Variable: content
         Comment content.
    */
	public $content;
	
    /*
       Variable: state
         Comment state.
    */
	public $state = 0;

    /*
       Variable: _parent
         Comment parent.
    */
	protected $_parent;

    /*
       Variable: _children
         Comment children.
    */
	protected $_children = array();

	
	
	/*
		Function: getItem
			Retrieve related item object.

		Returns:
			Item
 	*/
	public function getItem() {
		return YTable::getInstance('item')->get($this->item_id);
	}

	/*
		Function: getAuthor
			Retrieve related author object.

		Returns:
			CommentAuthor
 	*/
	public function getAuthor() {
		
		static $authors = array();
		
		$key = md5($this->author . $this->email . $this->url . $this->user_id);
		if (!isset($authors[$key])) {
			$class_name = 'CommentAuthor'.$this->user_type;
			$authors[$key] = new $class_name($this->author, $this->email, $this->url, $this->user_id);
		}
		
		return $authors[$key];

	}
	
	/*
		Function: bindAuthor
			Bind Author object.

		Returns:
			CommentAuthor
 	*/	
	public function bindAuthor(CommentAuthor $author) {
		$this->author = $author->name;
		$this->email = $author->email;
		$this->url = $author->url;
		
		// set params
		if (!$author->isGuest()) {
			$this->user_id = $author->user_id;
			$this->user_type = $author->getUserType();
		}
	}
	
	/*
		Function: getParent
			Retrieve parent comment.

		Returns:
			Comment
 	*/
	public function getParent() {
		return $this->_parent;
	}

	/*
		Function: setParent
			Set parent comment.

		Returns:
			Comment
 	*/
	public function setParent($parent) {
		$this->_parent = $parent;
		return $this;
	}
	
	/*
    	Function: getChildren
    	  Retrieve all child comments.

	   	  Returns:
	        Array - Array of child comments
 	*/
	public function getChildren() {
		return $this->_children;
	}	
	
	/*
    	Function: addChild
    	  Add a child.

	   Returns:
	      Comment
 	*/	
	public function addChild($child) {
		$this->_children[$child->id] = $child;
		return $this;
	}

	/*
    	Function: removeChild
    	  Remove a child.

	   Returns:
	      Comment
 	*/	
	public function removeChild($child) {
		unset($this->_children[$child->id]);
		return $this;
	}

	/*
    	Function: hasChildren
    	  Check if child comments exist.

	   	  Returns:
	        Boolean
 	*/
	public function hasChildren() {
		return !empty($this->_children);
	}

	/*
		Function: getPathway
			Method to get comments pathway.

		Returns:
			Array - Array of parent comments
	*/
	public function getPathway() {
		if ($this->_parent == null) {
			return array();
		}
		
		$pathway   = $this->_parent->getPathway();
		$pathway[] = $this;

		return $pathway;
	}

}