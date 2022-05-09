package hello;
import jsasync.IJSAsync;
import haxeburner.Bitburner;
import haxeburner.Script;

@:keep
class Hello extends Script implements IJSAsync {
    @:jsasync
    public override function run(ns: Bitburner): Promise<Nothing> {
        var targetName = ns.args[0];
        trace('Hostname $targetName');
        var target = ns.system.getComputer(targetName);
        var moneyThresh = target.maxMoney() * 0.75;
        var secThresh = target.minSecurityLevel() + 5;

        target.nuke();

        while (true) {
            if (target.securityLevel() > secThresh) {
                trace('Weakening $targetName (slvl ${target.securityLevel()})');
                target.weaken().jsawait();
            } else if (target.moneyAvailable() < moneyThresh) {
                trace('Growing $targetName (money ${target.moneyAvailable()})');
                target.grow().jsawait();
            } else {
                trace('Hacking $targetName');
                target.hack().jsawait();
            }
        }
    }
}