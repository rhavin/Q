var search_data = {"index":{"searchIndex":["object","q","address","bankaccount","console","phone","validator","bic=()","blz=()","iban=()","invalidate()","knr=()","new()","new()","new()","new()","nyi()","oninvalidate()","out()","t()","txalert()","txbold()","txcode()","txcolorize()","txconfirm()","txformat()","txhead()","txnote()","txref()","txsanitize!()","txunderline()","txwarn()","gemfile","license","rakefile","update"],"longSearchIndex":["object","q","q::address","q::bankaccount","q::console","q::phone","q::validator","q::bankaccount#bic=()","q::bankaccount#blz=()","q::bankaccount#iban=()","q::validator#invalidate()","q::bankaccount#knr=()","q::address::new()","q::bankaccount::new()","q::phone::new()","q::validator::new()","q::console::nyi()","q::bankaccount#oninvalidate()","q::console::out()","object#t()","q::console::txalert()","q::console::txbold()","q::console::txcode()","q::console::txcolorize()","q::console::txconfirm()","q::console::txformat()","q::console::txhead()","q::console::txnote()","q::console::txref()","q::console::txsanitize!()","q::console::txunderline()","q::console::txwarn()","","","",""],"info":[["Object","","Object.html","",""],["Q","","Q.html","","<p>Namespace providing module for common widely used data structures currently\nproviding:\n<p>Q::Phone &mdash; telephone …\n"],["Q::Address","","Q/Address.html","","<p>a physical (real world) address this class is used by users and firms\n"],["Q::BankAccount","","Q/BankAccount.html","","<p>bank billing and account information this class is used by users and firms\n"],["Q::Console","","Q/Console.html","","<p>Q::Console handles communication to console later implementations will add\nlogging and live-maintenance …\n"],["Q::Phone","","Q/Phone.html","","<p>a telephone number this class is used by users and firms, a simple wrapper\nto be extended\n"],["Q::Validator","","Q/Validator.html","","<p>The validator provides common functionality for all validatable objects.\n"],["bic=","Q::BankAccount","Q/BankAccount.html#method-i-bic-3D","(b)","<p>Set account to giveb BIC. According to ISO 9362\n(en.wikipedia.org/wiki/ISO_9362) the BIC is composed …\n"],["blz=","Q::BankAccount","Q/BankAccount.html#method-i-blz-3D","(b)",""],["iban=","Q::BankAccount","Q/BankAccount.html#method-i-iban-3D","(i)","<p>Set account to given IBAN. An IBAN consists of up to 34 uppercase\nalphanumeric latin chars.\n"],["invalidate","Q::Validator","Q/Validator.html#method-i-invalidate","(str, arrAttr)","<p>Invalidate the object. Given string <strong>str</strong> contains\nformat-code that will be substituted with given attribute …\n"],["knr=","Q::BankAccount","Q/BankAccount.html#method-i-knr-3D","(k)",""],["new","Q::Address","Q/Address.html#method-c-new","(plzOrZip, town, street, number, country, state)",""],["new","Q::BankAccount","Q/BankAccount.html#method-c-new","(mode, ibanOrKnr, bicOrBlz, holder, institute)","<p>constructor, specify mode constant MODE_.. for account\n"],["new","Q::Phone","Q/Phone.html#method-c-new","(num)","<p>initialize new object with given number <strong>num</strong>\n"],["new","Q::Validator","Q/Validator.html#method-c-new","(obj, onInvalidateFn)","<p>initialize this object with a reference to the validatable object and a\nfunction called if object gets …\n"],["nyi","Q::Console","Q/Console.html#method-c-nyi","(text)","<p>reminder of NOT YET IMPLEMENTED functionality\n"],["onInvalidate","Q::BankAccount","Q/BankAccount.html#method-i-onInvalidate","()","<p>handler called if object has been invalidated\n"],["out","Q::Console","Q/Console.html#method-c-out","(str)","<p>shortcut to sanitize given string and output it to console\n"],["t","Object","Object.html#method-i-t","(text)","<p>Macro-like helper handling localization of strings from I18n module\n"],["txAlert","Q::Console","Q/Console.html#method-c-txAlert","(text)","<p>render given <strong>text</strong> with COLOR_ALERT\n"],["txBold","Q::Console","Q/Console.html#method-c-txBold","(text)",""],["txCode","Q::Console","Q/Console.html#method-c-txCode","(text)","<p>render given <strong>text</strong> as representation of given code\n"],["txColorize","Q::Console","Q/Console.html#method-c-txColorize","(text, color)","<p>ansi-wrappers, see en.wikipedia.org/wiki/ANSI_escape_code\n"],["txConfirm","Q::Console","Q/Console.html#method-c-txConfirm","(text)","<p>render given <strong>text</strong> with COLOR_CONFIRM\n"],["txFormat","Q::Console","Q/Console.html#method-c-txFormat","(str, arrVals)","<p>This is an extented sprintf-function that allowes usage of _type\nsubstituted by bold type and _S substituted …\n"],["txHead","Q::Console","Q/Console.html#method-c-txHead","(text)","<p>render given <strong>text</strong> as a skript head, currently hardcoded\nbright blue\n"],["txNote","Q::Console","Q/Console.html#method-c-txNote","(text)","<p>render given <strong>text</strong> with COLOR_NOTE\n"],["txRef","Q::Console","Q/Console.html#method-c-txRef","(text)","<p>render given <strong>text</strong> as object- or module- reference\n"],["txSanitize!","Q::Console","Q/Console.html#method-c-txSanitize-21","(str)","<p>reinterpret ansi-color ‘default’ as last set color in given string this is\nsimply because most terminals …\n"],["txUnderline","Q::Console","Q/Console.html#method-c-txUnderline","(text)",""],["txWarn","Q::Console","Q/Console.html#method-c-txWarn","(text)","<p>render given <strong>text</strong> with COLOR_WARN\n"],["Gemfile","","Gemfile.html","","<p>source ‘rubygems.org’\n<p># Specify your gem’s dependencies in DataCore.gemspec gemspec\n"],["LICENSE","","LICENSE_txt.html","","<p>This Software is in initial developement and shall not be used.\n"],["Rakefile","","Rakefile.html","","<p>require “bundler/gem_tasks”\n"],["update","","update.html","","<p>#! /bin/bash gem build Q.gemspec gem install Q –no-rdoc –no-ri gem clean\n"]]}}