require 'spec_helper'

# ポート22番の確認
describe port(22) do
  it { should be_listening }
end

# httpd.conf ファイルの存在確認
describe file('/etc/httpd/conf/httpd.conf') do
  it { should be_file }
end

# ホームディレクトリの確認
describe file('/home/ec2-user') do
  it { should be_directory } # ディレクトリ
  it { should be_mode 700 } # パーミッション
  it { should be_owned_by 'ec2-user' } # ownerがec2-user
end

# httpd サービスに関するテスト
describe service('httpd') do
  it { should be_enabled   } # 自動起動が有効になっているか
  it { should be_running   } # 実行されているか
end

# describe ＜リソースタイプ＞(＜テスト対象＞) do
#   ＜テスト条件＞
# end
