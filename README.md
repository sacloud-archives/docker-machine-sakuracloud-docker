
# Docker Machine with さくらのクラウド

[`Docker Machine`](https://github.com/docker/machine) + [`さくらのクラウド用ドライバ`](https://github.com/yamamoto-febc/docker-machine-sakuracloud)のDockerイメージです。

DockerMachine: v0.12.1  

## `Dockerfile` links

- [`0.0.15`,`latest`(Dockerfile)](https://github.com/yamamoto-febc/docker-machine-sakuracloud-docker/tree/master/0.0.15/)


## 使い方(docker-composeを使う場合)

#### 1) 以下コマンドで`docker-compose.yml`と環境変数設定ファイルのひな形をダウンロードします。

```bash
curl -L https://github.com/yamamoto-febc/docker-machine-sakuracloud-docker/raw/master/docker-compose.yml > docker-compose.yml
curl -L https://github.com/yamamoto-febc/docker-machine-sakuracloud-docker/raw/master/env-sample > .env
```

#### 2) (**オプション**)環境変数設定ファイルを編集します。

このファイルで環境変数を設定しておくとdocker-machineコマンド実行時に
必要なオプションを省略できます。

アクセストークン`SAKURACLOUD_ACCESS_TOKEN`とシークレット`SAKURACLOUD_ACCESS_TOKEN_SECRET`の
設定をしておくと便利です。

```bash
vi .env
```

#### 3) docker-composeコマンドの実行

以下コマンドでdocker-machineを起動します。

#### サーバ一覧取得の実行例
```bash
docker-compose run --rm docker-machine ls
```

#### さくらのクラウド上へサーバ作成の例(サーバ名：sakura-dev)
```bash
docker-compose run --rm docker-machine create -d sakuracloud sakura-dev
```


Docker Machine + さくらのクラウド用ドライバの詳しい使い方は[`こちら`](https://github.com/yamamoto-febc/docker-machine-sakuracloud)を参照してください。

## 使い方(Docker Composeなし、dockerコマンドを直接使う場合)


### 起動コマンド書式

```bash
docker run -it --rm sacloud/docker-machine 実行したいコマンド
```

### さくらのクラウド上へサーバ作成の例(サーバ名:sakura-dev)
```bash
docker run -it --rm -e MACHINE_STORAGE_PATH=$HOME/.docker/machine \
                    -e SAKURACLOUD_ACCESS_TOKEN=[トークン] \
                    -e SAKURACLOUD_ACCESS_TOKEN_SECRET=[シークレット] \
                    -v $HOME/.docker:$HOME/.docker \
                    sacloud/docker-machine create -d sakuracloud sakura-dev
```

