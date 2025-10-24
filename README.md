# OceanCleanerSim
XR prototyping assignment

# Ocean Cleaner Sim

From the perspective of a self sufficient robot, you are to clean the ocean from pollution through any means necessary.
The more you clean the more you earn, help out and clean the ocean from trash like plastic, Oil, waste and chemicals.

The project is focused on two SDG's, SDG 6 Clean water and Sanitation, and SDG 14 Life below water, the project will teach and encourage the user to do their best to keep the water clean.
By giving the user hints and verbal queues about the consequences of dirty oceans this should teach and educate them about the 14th and 6th SDG.

This will be a standalone project.

Solo project by Jello Sarmiento (C22531133)

## Key Features
- UI to start the experience.
- Help page to educate and explain controls and mechanics about the game, as well as the SDGs.
- XR interactions in the experience consist of:
  - Picking up objects, placing them into bags on the user.
  - Suck up liquid waster from the floor / water.
  - Allow the user to upgrade how much currency they get per trash cleaned.
  - Buttons for upgrading and selling trash.
  - Allow the user to walk around the surface.
- Give the user a meter/score for how much trash they have cleared up.
- A way to "win" the experience.

## XR Technologies used
- 3D UI
- Spatial Audio
- XR Controller tracking

# Sample Preview
Here are some simple 3D blockouts of the main stage for the experience.

**Main UI**

<img width="488" height="245" alt="image" src="https://github.com/user-attachments/assets/b28d1da1-0ffa-43f6-8d2f-9c81382a8039" />

The image above is how the users main UI panel will look like, this will appear on the users forearm e.g. right before the users hand, this will start on the left hand but is moveable to the users right hand with the settings page.
On this page the user can see how much space is left in their bag with the slider to show how full their bag is, and then the amount of points the user currently has.
Possibly allow the player to buy upgrades here.

<img width="455" height="281" alt="image" src="https://github.com/user-attachments/assets/17d4a2b0-0154-4c7d-b132-fbd8e29ae89f" />

This is what the UI would look like attached to the users hand.

**Key interactions**

<img width="393" height="249" alt="image" src="https://github.com/user-attachments/assets/ba14f246-1032-482b-8435-f949a1e0fcd9" />

This is the objects that the user will primarily be interacting with, the brown box for now represents the trash, and the black cylinder will represent liquids, to pick up the trash the user will be able to just move over to the trash with the controller and then grab, with the trigger.
For the liquid it is a different interaction

<img width="395" height="192" alt="image" src="https://github.com/user-attachments/assets/b2b6d62f-b708-4269-ad9b-7b089c237b0b" />

This yellow block represents a magic sponge and will be used up for collecting liquids such as chemicals (multi colored) and oil (black) in the water, after that once the user has hovered the sponge over the spillage, it will remove the spillage from the scene and add one to the users bag total.

When the user is done collecting or has a full bag, they must return to the Wall of upgrades (the image below) and hover the users hand / bag over the trashcan (the image below), after this the user will have then gained the amount of points relative to their upgrades and trash / liquids they have disposed off

**Layout / environment**

<img width="602" height="333" alt="image" src="https://github.com/user-attachments/assets/979eb37c-8ccc-4b14-a924-5ec5581620a4" />

The image above shows the main player interaction points, the gray cylinder represents the bin / trashcan, this is where the user would put the items in, by throwing the items in individually or inside of a trashbag.
The blue wall beside it is the upgrades wall, i.e. the wall where the user can upgrade how much they can put in their bag, how much each trash costs etc,.

<img width="500" height="291" alt="image" src="https://github.com/user-attachments/assets/67c0bde3-394e-4661-8b50-40ef4fc94bfc" />

In the image above this shows the floor layout as well as the green square where trash and liquids (puddles) will randomly spawn, underneath the blue is the main floor of the world, this will be what the player is standing on at all times.
There will be some sort of png background to show the sky and the general skybox.
