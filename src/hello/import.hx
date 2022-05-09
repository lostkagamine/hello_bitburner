package hello;

#if js // Only import if target is js to avoid breaking your macros.
import jsasync.JSAsync.jsasync;
import jsasync.JSAsyncTools.jsawait;
import js.lib.Promise;
import jsasync.Nothing;
using jsasync.JSAsyncTools;
#end