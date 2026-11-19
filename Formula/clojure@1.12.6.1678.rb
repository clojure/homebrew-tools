class ClojureAT11261678 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.6.1678/clojure-tools-1.12.6.1678.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.6.1678.tar.gz"
  sha256 "342a87abade4e8bcb59288d5f41c601335d668742aaf1dce2c5c9f1efcb95113"
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
