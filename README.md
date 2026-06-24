# Awesome PotPvP

A central repository for PotPvP resource packs maintained by Mvk, Japonya, and the community.

## Download
You can download the packs using whichever method you prefer:

**Method 1: Direct Download**
1. Go to the **Actions** tab on this repository.
2. Click the latest run of **Create Resourcepack Zips**.
3. Download the `Resource-Packs` artifact.
4. Extract the `.zip` files into your `.minecraft/resourcepacks` folder.

**Method 2: Command Line (All Packs At Once)**
Open your terminal inside your `.minecraft/resourcepacks` folder and run:
```bash
git clone https://github.com/Mvkweb/awesome-potpvp.git
```
*(Or if you use GitHub CLI: `gh repo clone Mvkweb/awesome-potpvp`)*

## Structure
Every folder in this repository is treated as a separate resource pack. You can use Lunar Client to natively load packs from subfolders.

## Contributing (Community)
If you want to add a new pack or fix textures, you can submit a Pull Request.

1. Fork this repository.
2. Add your resource pack folder to the root.
3. Make sure to name your branch with your own name (e.g., `Mvk` or `Japonya` or `YourName`).
4. Open a Pull Request to the `merged` branch.
5. If accepted, your pack will be automatically zipped and added to the official downloads.

## Admin Setup (Mvk & Japonya)

**Initial Setup:**
Open your terminal inside your `.minecraft/resourcepacks` folder:
```bash
git clone https://github.com/Mvkweb/awesome-potpvp.git main
cd main
```

**How to work on your branch (Example for Mvk):**
When you want to add or update your own packs, make sure you do it on your specific branch.

1. Switch to your branch:
```bash
git checkout Mvk
```
2. Put your new pack folders inside the directory and push them:
```bash
git add .
git commit -m "Added my new pack"
git push -u origin Mvk
```
The GitHub Action will automatically combine your push into the `merged` branch!

**Update Local Files:**
To download the combined work from all branches:
```bash
git checkout merged
git pull origin merged
```
