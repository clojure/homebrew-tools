class ClojureAT11201506 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1506/clojure-tools-1.12.0.1506.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1506.tar.gz"
  sha256 "3db59ebc7720b0a7cd6b992fd96937ca6b6a930c565fd6dd932849ec667e38ac"
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
