The Forgotten Tibia
===============

The Forgotten Tibia Server is a free and open-source MMORPG server emulator written in C++.<br />
It is a fork from the [The Forgotten Server 1.3](https://github.com/otland/forgottenserver/commit/3b63f65) and [OTClient](https://github.com/edubart/otclient/commit/07b4b78) projects.

### What makes it different from The Forgotten Server 1.3?

* There are no vocations:<br />
Everyone starts as a normal human being with points to be distributed among the skills.

* There is no skill training:<br />
It uses a system to advance skills by distributing points.

* All clubs, swords and axes damage are based on strenght.

* Distance weapons damage are based on strenght and/or dexterity.

* Two-handed melee weapons gives critical hit chance, critical hit damage and can do bleeding effect.

* The more levels you get, less points you receive.

### Skills
![](images/CharacterMastery.gif)

### Custom Systems

* Dual Wield:<br />
![](images/DualWield.gif)

The player can use 2 weapons (for example: club and sword, axe and spear, sword and throwing knife). The attack speed will be fixed in 200% but the damage will drop to 75%. Each combat turn the player will use one hand to defend and the other to attack.

* Two Handed Melee Weapons:<br />
All two-handed melee weapons give +25% of critical hit chance and +100% of critical hit amount. Also, they have a chance of giving a bleeding effect to the target.

* Auto Loot Gold:<br />
![](images/AutoLoot.gif)

The money dropped from monsters goes directly to the player.

* Quiver:<br />
![](images/Quiver.gif)

Distance weapons are loading ammo from container item in the arrow slot and there is a new container item called "quiver".

* Wands and Rods varying with skills:<br />
Intelligence and faith raises the wands/rods maximum damage.

* Spells based on Faith and Intelligence:<br />
There is no level and vocation requirement for spells. The more you raise faith and intelligence, more spells you get.

* Screen with one more tile:<br />
It was added one more square meter to the screen.

### Getting Started

* Follow the official [Compiling Tutorial](https://github.com/otland/forgottenserver/wiki/Compiling) for The Forgotten Server 1.3 to generate the executable to run the server ([compiling on Visual Studio 2017](https://github.com/otland/forgottenserver/wiki/Compiling-on-Windows-%28vcpkg%29)).
* [Scripting Reference](https://github.com/otland/forgottenserver/wiki/Script-Interface) (The Forgotten Server 1.3)

### Support

If you need help, please visit the [OTLand official thread](https://otland.net/threads/otclient-the-forgotten-tibia-server-0-8.262301/). Our issue tracker is not a support forum, and using it as one will result in your issue being closed.

### Issues

We use the [issue tracker on GitHub](https://github.com/GustavoContreiras/TheForgottenTibiaServer/issues). Keep in mind that everyone who is watching the repository gets notified by e-mail when there is activity, so be thoughtful and avoid writing comments that aren't meaningful for an issue (e.g. "+1"). If you'd like for an issue to be fixed faster, you should either fix it yourself and submit a pull request, or place a bounty on the issue.
