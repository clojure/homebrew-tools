class ClojureAT11201523 < Formula
  desc "The Clojure Programming Language"
  homepage "https://clojure.org"
  url "https://github.com/clojure/brew-install/releases/download/1.12.0.1523/clojure-tools-1.12.0.1523.tar.gz"
  mirror "https://download.clojure.org/install/clojure-tools-1.12.0.1523.tar.gz"
  sha256 "fcdd18f766dd44a67fecd91744b3d4a0d3a7ee1ea837cc49b9316e1416ecf44b"
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
