# github-action-s3-upload

Github action to upload a single file to an S3 bucket.  This is heavily based on the excellent work from [Jake Jarvis](https://github.com/jakejarvis) with his [sync action](https://github.com/jakejarvis/s3-sync-action)

## Usage

### `workflow.yml` Example

Place in a `.yml` file such as this one in your `.github/workflows` folder. [Refer to the documentation on workflow YAML syntax here.](https://help.github.com/en/articles/workflow-syntax-for-github-actions)

```bash
name: Upload to S3
on: push

jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@master

    - name: Upload artifact to S3
      uses: docker://rewindio/github-action-s3-upload
      with:
       args: --acl public-read
      env:
        SOURCE_FILE: ./dist/mywidget.js
        AWS_REGION: us-east-1
        AWS_S3_BUCKET: cdn-origin-bucket
        AWS_S3_FOLDER: api/artifact/1.0.0
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
```

### Environment Variables

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `SOURCE_FILE` | The local file you wish to upload to S3. For example, `./myfile.txt`. | `env` | **Yes** |
| `AWS_S3_BUCKET` | The name of the bucket you're syncing to. For example, `cdn-origin-bucket`. | `env` | **Yes** |
| `AWS_REGION` | The region where you created your bucket in. For example, `us-east-1`. Defaults to `us-east-1` if not specified | `env` | **No** |
| `AWS_S3_FOLDER` | An optional folder to place the file into.  For example `myfolder1/myfolder 2`. | `env` | **No** |
| `AWS_S3_ENDPOINT` | The endpoint URL of the bucket you're syncing to. Can be used for [VPC scenarios](https://aws.amazon.com/blogs/aws/new-vpc-endpoint-for-amazon-s3/) or to use AWS FIPS endpoints

### Required Secret Variables

The following variables should be added as "secrets" in the action's configuration.

| Key | Value | Type | Required |
| ------------- | ------------- | ------------- | ------------- |
| `AWS_ACCESS_KEY_ID` | Your AWS Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `secret` | **Yes** |
| `AWS_SECRET_ACCESS_KEY` | Your AWS Secret Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `secret` | **Yes** |

## License

This project is distributed under the [MIT license](LICENSE.md).
