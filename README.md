# Terraform-code-examples

Чтобы сгенерировать ключ key.json:

yc iam key create --service-account-name $YOUR_SERVICE_ACCOUNT_NAME --output key.json

Для просмотра списка images:

yc compute image list --folder-id standard-images

Также необходимо создать статический ключ доступа к своему сервисному аккаунту и прописать его в файле storage.key.

---

Файлы key.json и storage.key должны находиться в каждом рабочем каталоге terraform.
