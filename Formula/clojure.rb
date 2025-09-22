class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.2.1571/clojure-tools-1.12.2.1571.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.2.1571.tar.gz"
  sha256 "b81149ed66d4cf62c8dff57a48b67a4b673bef4ee3f70c4fbf958e99a95c9efe"
  license "EPL-1.0"

  depends_on "rlwrap"

  uses_from_macos "ruby" => :build

  def install
    system "./install.sh", prefix
  end

  test do
    ENV["TERM"] = "xterm"
    system("#{bin}/clj -M -e nil")
    %w[clojure clj].each do |clj|
      assert_equal "2", shell_output("#{bin}/#{clj} -M -e \"(+ 1 1)\"").strip
    end
  end
end
