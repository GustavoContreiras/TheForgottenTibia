// Hides and unhides the HTML elements with the specified names
//
// @param a_ElementsToHide HTML ID of the element to hide as string
//                         or an array of IDs as strings
// @param a_ElementsToShow HTML ID of the element to make visible
//                         as string or an array of IDs as strings
function ToggleVisibility(a_ElementsToHide, a_ElementsToShow)
{
  if (typeof(a_ElementsToHide) == 'object') { // array
    for (var i = 0; i < a_ElementsToHide.length(); ++i) {
      document.getElementById(a_ElementsToHide[i]).style.display = 'none';
    }
  } else if (typeof(a_ElementsToHide) == 'string') {
    document.getElementById(a_ElementsToHide).style.display = 'none';
  }
  
  if (typeof(a_ElementsToShow) == 'object') { // array
    for (var i = 0; i < a_ElementsToShow.length(); ++i) {
      document.getElementById(a_ElementsToShow[i]).style.display = 'block';
    }
  } else if (typeof(a_ElementsToShow) == 'string') {
    document.getElementById(a_ElementsToShow).style.display = 'block';
  }
}

// Adds a limitation of the maximum text length on a text area
// input, that is enforced by JS
//
// All previously assigned event handlers of the text area are preserved.
//
// @param TextAreaID HTML ID of the text area
// @param MaxLen Positive int specifying the maximum number of characters
//               that can be entered in the text area
function SetLenLimit(TextAreaID, MaxLen)
{
  var TextArea = document.getElementById(TextAreaID);
  if (TextArea == null) { CipLogError('SetLenLimit(): Input "' + TextAreaID + '" not found'); return; }

  EnforceLenLimitClosure = function()
  {
    if (TextArea.value.length > MaxLen) {
      TextArea.value = TextArea.value.substring(0, MaxLen);
    }
  };
  AddEventHandler(TextArea, 'onkeyup', EnforceLenLimitClosure);
  AddEventHandler(TextArea, 'onblur', EnforceLenLimitClosure);
}

// Installs an event handler on a text area input that dynamically updates
// a counter showing the remaining allowed number of characters
// 
// All previously assigned event handlers of the text area are preserved.
// 
// @param TextAreaID HTML ID of the text area
// @param CounterID HTML ID of the span or div element where the remaining
//                  number of characters will be put in
// @param MaxLen Positive int specifying the maximum number of characters
//               that can be entered in the text area
function SetRemainingLenCounter(TextAreaID, CounterID, MaxLen)
{
  var TextArea = document.getElementById(TextAreaID);
  if (TextArea == null) { CipLogError('SetLenLimit(): Text area input "' + TextAreaID + '" not found'); return; }
  var Counter = document.getElementById(CounterID);
  if (Counter == null) { CipLogError('SetLenLimit(): Counter input "' + CounterID + '" not found'); return; }
  
  UpdateCounterClosure = function()
  {
    Counter.innerHTML = MaxLen - TextArea.value.length;
  };
  AddEventHandler(TextArea, 'onkeyup', UpdateCounterClosure);
  AddEventHandler(TextArea, 'onblur', UpdateCounterClosure);
  TextArea.onkeyup();
}


// -------------------
// debugging functions
// -------------------

// Set to true to enable error logging
var EnableDebug = true;

// Default error logger, logs to the FireBug console
function CipLogError(ErrMsg)
{
  if (EnableDebug) console.error(ErrMsg);
}

// -------------------------
// internal helper functions
// -------------------------

// Adds a new event handler function to the specified event handler of
// a DOM object
// 
// The new event will be appended to the end of the call chain and
// will fire after the previous events have sucessfully completed.
// 
// @param Element DOM object that we want to add the event handler to
// @param EventHandlerName Name of the event handler function that we
//                         want to add the event to, e.g. 'onclick' or
//                         'onkeyup'
// @param Function New event handler to be added to the existing ones
function AddEventHandler(Element, EventHandlerName, Function)
{
  var EventHandler = Element[EventHandlerName];
  if (EventHandler) {
    Element[EventHandlerName] = function() { EventHandler(); Function(); };
  } else {
    Element[EventHandlerName] = Function;
  }
}