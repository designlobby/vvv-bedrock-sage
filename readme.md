# VVV Bedrock Sage stack

Tested with VVV 2.0 | Bedrock 4.8.2 | Sage 8.5.3

[Varying Vagrants Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV),
[Bedrock](https://github.com/roots/bedrock),
[Sage 8.5.3](https://github.com/roots/sage/tree/8.5.3).

- Make sure bower is being installed in provision/provision.sh.
- Add new sites to vvv-custom.yml.

1. Clone into `vvv/www`: `git clone https://github.com/designlobby/vvv-bedrock-sage.git project-name`.
2. If vagrant is already running, run `vagrant halt`.
3. Edit vvv-nginx.conf project-name.dev; `server_name project-name.dev;`.
4. Edit vvv-init.sh variable to `project="project-name"`.
5. Run `vagrant up --provision`.

This will create your database, install bedrock, and install sage(8.5.3).

- If your production server's home folder is not `web`, do the following:

6. Update vvv-nginx.conf with correct server path. E.g. `/htdocs/public_html`.
7. Update folder `/htdocs/web` to `/htdocs/public_html`.
8. Update instances of `web` to `public_html` in `config/application.php`, `wp-cli.yml`, `composer.json`, and `.gitignore`.
9. Run `vagrant reload --provision`.

Now point to the database!

10. Update the `.env` file in `htdocs` to your `project-name` DB and URL settings. Default config is:
`DB_NAME=project-name`
`DB_USER=wp`
`DB_PASSWORD=wp`
`DB_HOST=localhost`

Visit [http://project-name.dev/].
