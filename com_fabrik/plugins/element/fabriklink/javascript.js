var fbLink = FbElement.extend({

	initialize : function(element, options) {
		this.parent(element, options);
		this.plugin = 'fabrikLink';
		this.setOptions(element, options);
	},

	setOptions : function(element, options) {
		this.element = $(element);
		var d = [];
		this.options = {
			element : element,
			defaultVal : d
		};
		$extend(this.options, options);
		var ok = true;
		this.subElements = this._getSubElements();
		this.setorigId();
	},

	setorigId : function() {
		if (this.options.repeatCounter > 0) {
			var e = this.options.element;
			this.origId = e.substring(0, e.length - 1 - this.options.repeatCounter.toString().length);
		}
	},

	update : function(val) {
		var subs = this.element.getElements('.fabrikinput');
		if ($type(val) === 'object') {
			subs[0].value = val.label;
			subs[1].value = val.link;
		} else {
			if ($type(val) == 'array') {
				subs[0].value = val[0];
				subs[1].value = val[1];
			} else {
				subs.each(function(i) {
					i.value = val;
				});
			}
		}
	},

	addNewEvent : function(action, js) {
		if (action == 'load') {
			this.loadEvents.push(js);
			this.runLoadEvent(js);
		} else {
			this.subElements.each(function(el) {
				el.addEvent(action, function(e) {
					eval(js);
				});
			});
		}
	},
	// get the sub element which are the fields themselves

	_getSubElements : function() {
		if (!this.element) {
			this.subElements = $A([]);
		} else {
			this.subElements = this.element.getElements('input');
		}
		return this.subElements;
	},

	getValue : function() {
		var s = this._getSubElements();
		var a = [];
		s.each(function(v) {
			a.push(v.get('value'));
		});
		return a;
	}

});