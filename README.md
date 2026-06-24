# Awesome PotPvP

A central repository for PotPvP resource packs maintained by Mvk, Japonya, and the community.

## Download
You do not need to download the raw files or compile anything.
1. Go to the **Actions** tab on this repository.
2. Click the latest run of **Create Resourcepack Zips**.
3. Download the `Resource-Packs` artifact.
4. Extract the `.zip` files into your `.minecraft/resourcepacks` folder.

## Structure
Every folder in this repository that contains a `pack.mcmeta` file is treated as a separate resource pack. You can use Lunar Client to natively load packs from subfolders.

## Contributing (Community)
If you want to add a new pack or fix textures, you can submit a Pull Request.

1. Fork this repository.
2. Add your resource pack folder to the root (must contain a `pack.mcmeta` file).
3. Open a Pull Request to the `merged` branch.
4. If accepted, your pack will be automatically zipped and added to the official downloads.

## Admin Setup (Mvk & Japonya)

**Initial Setup:**
Open your terminal inside your `.minecraft/resourcepacks` folder:
```bash
git clone https://github.com/Mvkweb/awesome-potpvp.git main
cd main
```

**Workflow:**
Switch to your branch (`Mvk` or `Japonya`):
```bash
git checkout Mvk
```

Add your changes and push:
```bash
git add .
git commit -m "update textures"
git push origin Mvk
```
The GitHub Action will automatically merge your push into the `merged` branch and generate the download zips.

**Update Local Files:**
To download the combined work from all branches:
```bash
git checkout merged
git pull origin merged
```
