package hello;
import haxeburner.Bitburner;
import haxeburner.Script;

@:keep
class Hello extends Script {
    @:jsasync
    public override function run(ns: Bitburner): Promise<Nothing> {
        trace("hey there");
        ns.system.alert("testing");
    }
}