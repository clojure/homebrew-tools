class Clojure < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1495/clojure-tools-1.12.0.1495.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1495.tar.gz"
  sha256 "18cc13f87c74ec4f177bd83c4416d9ec2bb9142860db06055af7598e1b82949c"
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
