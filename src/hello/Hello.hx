package hello;
import haxeburner.Bitburner;
import haxeburner.Script;

@:keep
class Hello extends Script {
	public function run(ns: Bitburner) {
        ns.alert("hello there");
    }
}